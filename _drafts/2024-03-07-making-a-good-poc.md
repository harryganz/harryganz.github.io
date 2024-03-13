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

### Introduction

I am a huge fan of proofs of concept. Many software problems are "wicked" in that you cannot
assess how difficult they are going to be until you start solving them. Edge cases, backtracking,
hidden complexity, and unknowns pop up all over the place and it is impossible before you set out to
tell how long and winding the road really is. For that reason, a quick, targeted attempt at a partial solution
is often a good way of figuring out what the hard parts will be and whether your approach will actually work.
The problem I see with many P.O.Cs, however, is that they either aren't targeted properly, solving the
wrong problem, or they aren't quick, including too much. 

Before explaining how to make a good P.O.C. it is probably worth defining a few terms. What I
refer to as a proof of concept might be called something else by other people, so I would
like to make sure we are all on the same page.

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

### Step 1: Identify required scope

Sometimes proofs of concept fail to be useful because the team or person making the P.O.C. doesn't know what they are 
trying to solve. This happens when teams identify a technology they want to use but not what they actually want to do with it.
For example, a team might say "we want to containerize our application", but don't specify why they want to do that or what the 
containerization is meant to achieve. The person making the P.O.C. then makes a Dockerfile, runs a "hello world" application on it
then calls it a P.O.C. This is not a P.O.C. I would call this a technology demonstration: not useless if you have no experience 
with Docker, but it doesn't really get you any closer to assessing the feasibility of your proposed solution to your problem.

In order to have a successful P.O.C. you must identify the required scope of the software product. Using a real example, my team 
wanted to replace our in-house OAuth2 identity provider with something else and we wanted to assess a well regarded open source 
solution. We were looking for as close to a a drop-in replacement as we could and as-such it would need to do several things:

1. Support authorization code, client credentials, refresh token, and jwt-bearer grant types
2. Support custom HTML/CSS on login page based on URL parameters
3. Have default scopes that do not prompt users
4. Limit scopes and grant types on a per-client basis
5. Allow close to zero downtime migration of users with hashed/salted passwords
6. Allow close to zero downtime migration of existing clients with custom fields
7. Allow passing off authorization for some users to a third-party OAuth provider
8. Support client-only authentication with the jwt-bearer grant type
9. Support OIDC protocol
10. Have support for RBAC
11. Allow JWT claim customization

This scope would be too much for a P.O.C. as anything that would fulfill all of it would basically be the final product.
To get the scope of the P.O.C. we needed to use our best judgement to identify the factors that presented the biggest technical 
challenges or which had the highest uncertainty. We knew that anything that supported OAuth2 and OIDC would support the most common
grant types: authorization code, client credentials and refresh token, but jwt-bearer was a bit rarer of a grant type, so that was 
what we focused on. We also knew from reading documentation that things like custom login pages, default scopes, RBAC support, and JWT claim customization should be possible. Based on this, we focused our P.O.C. on the following requirements:

1. Allow close to zero downtime migration of users with hashed/salted passwords
2. Allow close to zero downtime migration of clients with custom fields
3. Allow passing off authorization for some users to third-party OAuth provider
4. Support client-only authentication with jwt-bearer grant type

### Step 2: Timebox your P.O.C.

One of the issues with proofs of concept is that, given enough time nearly any approach is possible. 
