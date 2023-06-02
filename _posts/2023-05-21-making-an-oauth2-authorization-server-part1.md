---
layout: post
title: Making an Oauth2 Authorization Server | Part 1
date: 2023-05-21 21:02:00 -0400
categories: oauth2
---

Oauth2 is one of those things that most web developers have to use, but many do not really understand. Maybe you use Passprt.js or an Okta client to handle the logic for you and are left scratching your head when something doesn't work the way you want. If you don't want to know, then you can stop reading. However, if you are curious and want to understand what Oauth2 is, what it is for, and how it is related to things like JSON Web Tokens (JWT) and OpenID connect this tutorial will explain it by building an authorization service in Go.

## Why?

I, probably like many developers, stumbled into OAuth2 when I had to integrate an application with an Okta client library. I didn't have any context, so understanding what exactly I needed or was supposed to do wasn't clear. I didn't know what was meant by a client, resource owner, resource server, etc. I looked at diagrams and read RFCs and eventually thought I understood, but then I would run into something I didn't know. What is a JWT and how do I sign one? What exactly is a "scope"? Where is an id token and how is it different from an access token? I learned each of these things ad-hoc and eventually developed (what I hope is) a coherent mental picture of the Oauth2 ecosystem (and it really is an ecosytem). What I'd like to do through this tutorial is help others to develop a coherent picture of how Oauth2 and its related standards work so you don't have to fall into the same pitfalls as me. I might also turn this into something usable, although that is not my goal. 

## So what is Oauth2?

In one sentence, Oauth2 is a way for a third-party service to authenticate with another service while allowing the end-user to control what level of access the third-party service has. A use case might be where your art-drawing app has write access to your Google Drive so it can store your drawing there, or a microservice might be able to access resources controlled by another microservice. Oauth2 is not a technology, but a standardized protocol. It is specified in (RFC 6749)[https://datatracker.ietf.org/doc/html/rfc6749] (if you have time, it is worth a read) and serves as the basis for numerous extenstions and variants. Much of the confusion about what Oauth2 is and is not related to the protocol itself, but the numerous extensions that have been built on top of it. 

## The Plan

In the first part my plan is to build an MVP which implements the basics of Oauth2 as specified by (RFC 6749)[https://datatracker.ietf.org/doc/html/rfc6749]. It should be able to:

* Have an admin list and delete user accounts
* Have an admin create, list, view, update, and delete clients
* Allow a user to create an account with a username and password
* Allow a user to login with their username and password and remain authenticated for a period of time
* Implement authorization endpoint for clients as specified by the RFC including error handling
* Allow a user to approve/deny scopes that a client requests
* Implement the token endpoint as specified by the RFC for the following grants
    * access_token
    * password
    * client_credentials
    * refresh_token
* Implicit  code flow should be implemented but disabled by default (we will implement PKCE later)
* Access tokens should be valid for 60 minutes by default and refresh tokens should be valid for 30 days, by default
* The validity of each token type should be updatable for each client