---
layout: post
title: Making a Good P.O.C.
---

Doing a proof-of-concept (P.O.C.) before building something complex or uncertain is an immensely useful 
tool when developing software; however, I learned that it is pretty easy to mess up a P.O.C. and turn
it from something useful into a total waste of time. If a P.O.C. is done right it can help identify
tricky parts of an approach and nail down feasibility. If a P.O.C. is done wrong, it could fail to
actually assess how feasible an approach is and lead to poor estimates, missed deadlines, and
possibly even an unusable mess of software.

### Why do a P.O.C.?

I am a huge fan of proofs of concept. Many software problems are "wicked" in that you cannot
assess how difficult they are going to be until you start solving them. Edge cases, backtracking,
hidden complexity, and unknowns pop up all over the place and it is impossible before you set out to
tell how long and winding the road really is. For that reason, a quick, targeted attempt at a partial solution
is often a good way of figuring out what the hard parts will be, and whether your approach will actually work. A good P.O.C.
can save time by preventing a team from going down "blind alleys" and, because you already have some idea of how hard the 
problem is to solve, will also improve time estimates for the final solution. A bad P.O.C. is simply a waste of time.

Before explaining how to make a good P.O.C. it is probably worth defining a few terms.

* Proof of concept (P.O.C) - A targeted solution to a specific technical challenge that is needed to fulfill the scope
  of a larger software product, but which does not necessarily fulfill the requirements of the software product 
  as a whole. Proofs of concept are usually used to help nail down the feasibility of a solution or to improve time or
  effort estimations.
* Prototype - A limited, non-production version of a software product intended to get feedback on the product approach, but 
  not necessarily the technical approach. Prototypes are useful in getting quick feedback on a solution and iterating 
  to a final design.
* Minimum Viable Product (M.V.P) - A production version of a software product which meets the minimum scope to 
  provide customer value. M.V.Ps are meant to be iterated on, but must be fully functional.
* Technology Demonstration - A demonstration of a potential technology which is not targeted towards any particular
  problem. Tech. Demos are meant to help learn a new technology and assess its usefulness for a software solution without
  targeting a particular technical approach.

These definitions are my own and may be used interchangeably elsewhere, but I like to use this taxonomy as it helps
to clarify the purpose of several pre-production versions of software. 

### Identify required scope

Sometimes proofs of concept fail to be useful because the team or person making the P.O.C. doesn't know what they are 
trying to solve. This happens when teams identify a technology they want to use but not what they actually want to do with it.
For example, a team might say "we want to containerize our application", but don't specify why they want to do that or what the 
containerization is meant to achieve. The person making the P.O.C. then makes a Dockerfile, runs a "hello world" application on it
then calls it a P.O.C. This is not a P.O.C. I would call this a technology demonstration: not useless if you have no experience 
with Docker, but it doesn't really get you any closer to assessing the feasibility of your proposed solution to your problem.

In order to have a successful P.O.C. you must identify the required scope of the software product. Using a real example, my team 
wanted to replace our in-house OAuth2 identity provider with something else and we decided to assess a well regarded open source 
solution. We were looking for as close to a drop-in replacement as we could, and, as such, it would need to do several things:

1. Support authorization code, client credentials, refresh token, and jwt-bearer grant types
2. Support custom HTML/CSS on login page based on URL parameters
3. Have default scopes that do not prompt users
4. Limit scopes and grant types on a per-client basis
5. Allow close to zero downtime migration of users with hashed/salted passwords
6. Allow close to zero downtime migration of existing clients with custom fields
7. Allow passing authentication for some users to a third-party OAuth provider
8. Support client-only authentication with the jwt-bearer grant type
9. Support the OIDC protocol
10. Have support for RBAC
11. Allow JWT claim customization

This scope would be too much for a P.O.C. as anything that would fulfill all of it would basically be the final product.
To get the scope of the P.O.C. we needed to use our best judgement to identify the factors that presented the biggest technical 
challenges or which had the highest uncertainty. We knew that anything that supported OAuth2 and OIDC would support the most common
grant types: authorization code, client credentials and refresh token, but jwt-bearer was a bit rarer of a grant type, so that was 
what we focused on. We also knew from reading documentation that things like custom login pages, default scopes, RBAC support, and JWT claim customization should be possible. Based on this, we focused our P.O.C. on the following requirements:

1. Allow close to zero downtime migration of users with hashed/salted passwords
2. Allow close to zero downtime migration of clients with custom fields
3. Allow passing authentication for some users to a third-party OAuth provider
4. Support client-only authentication with the jwt-bearer grant type

### Timebox your P.O.C.

One of the issues with proofs of concept is that, given enough time, nearly any approach is possible. To
really assess the feasibility of an approach you need to do it within a reasonable amount
of time. For that reason, set a time limit for your P.O.C., usually no more than two weeks. The goal is to
achieve as much as you can of your targeted scope in that time, and, even if you don't end up finishing everything
you set out to, you should have a good idea of what is easy, what is possible, what is difficult, and what is impossible in that time. 

For our OAuth2 project, we gave ourselves two weeks to build something that achieved the required scope. Doing so
required some hacks, but we did as much as we could. After two weeks we realized that using a third-party OAuth2 provider
would be easy, migrating users would be possible, supporting client-only authentication with jwt-bearer flow would be
difficult, and migrating existing clients with custom fields would be nearly impossible using what was provided by the service. 
This was a surprise as we expected client migration to be an out-of-the-box feature for an OAuth2 provider;
however, while it was possible to pass off client auth. to a custom service, there was no way of managing
our implementation of custom fields via readily accessible methods (we could have forked the code and used private methods, but
decided that was a bad idea). 


### What makes a good P.O.C.

A good P.O.C. is targeted to the most uncertain or challenging technical aspects of an approach to a software problem and
assesses the feasibility of the approach without taking too long to implement. The most common reason, in my experience, that 
P.O.Cs fail to be useful is that they target the wrong thing: usually targeting the most important or common use case, when they
should target the most difficult or uncertain. Sometimes they aren't even really P.O.C.s, but technology demonstrations.
P.O.C.s can also have limited usefulness if they take too long or target too much. Even if a proof of concept fails to meet
all of its objectives, it can still serve a useful platform for assessing the feasibility of an approach. I highly encourage anyone
to spend a few hours to a few days hacking out a quick solution to a hard problem before taking it on in production.