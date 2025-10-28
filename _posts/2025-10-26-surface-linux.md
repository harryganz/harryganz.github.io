---
title: Running Linux on a Surface Device
layout: post
---

When I saw the original Microsoft Surface I immediately though that it was the ideal laptop + tablet, two-in-one format: a perfect balance of power and portability. It had one problem, though. It ran Windows. It has been a decade, but I finally decided to get a Surface and turn it into the perfect, portable linux two-in-one that I had always dreamed of.

## The Hardware

The Surface name has branched out a bit into a set of only somewhat related devices, so I would
like to specify that I am talking about the Microsoft Surface Pro line of hyper portable, two-in-one devices.
These devices originally had Intel i3/i5/i7 processors, with the newest devices (10/11) having Snapdragon X 
Pro and X Elite CPUs. The hardware has always been an impressive amount of processing power in an incredibly
thin 12 or 13 inch. tablet. Microsoft also put a lot of thought into ergonomics, with a fairly unique kickstand
to keep the tablet at various angles and a detachable keyboard and stylus. The keyboard is worth talking about, as,
from the very start, it was well designed to both fold over the screen for transport, as well as be detachable, making
the Surface a "true" tablet. The more premium Alcantra keyboards (called "Type Covers") look nice and have decent
keys with a surprising amount of travel and feedback for such a thin keyboard. 

The downside the Surface hardware, at least historically, is that it's battery life has never been great. 
Not surprising given the use of modified i-series Intel chips, but a hyper portable device with 3-4 hours of 
use is not amazing. At least not anymore. I think that the use of mobile optimized Snapdragon chips would fix that
in the 10/11 series, but there is a reason that I cannot test that for myself, which I will get to.

Overall, I think that the Surface is the best possible hardware for a two-in-one that I have ever seen, 
and it is still shocking to me how niche it is as a device, and that competitors only occasionally try to 
rip it off (the Dell Latitude 7350, Asus Pro Art PZ13, and Lenovo X12 Gen 2 being counterexamples).

{% include responsive-image.html src='/assets/img/surface-linux/Surface_Pro_9_in_Sapphire_colour.jpg'
 alt='Surface Pro 9 in Sapphire Color with Type Cover. Photo by Kyler Chin' %}

## The Problem

 The problem with the Surface Pro is software. That is not to say that Windows is a bad operating system. There 
 are plenty of linux purists who will dump on Windows for any and all reasons, but I am not among them.
 Windows is a decent desktop environment with a UX that is very easy for people familiar with it to use. 
 Sure, it didn't have an officially supported package manager until far too recently (2020), and its
 default terminal is not POSIX compliant, but, for most people that is not very important. The real problem
 with using Windows for a tablet is that the operating system and all of its software is designed for 
 desktop, and tablet mode doesn't do enough to address it. 

 In my opinion, the perfect tablet interface runs a single application at a time, by default, with previously
 used applications fading into the background but easy to access. It also has a customizable home screen with
 gestures to access a list of all applications. Both iOS and Android are arranged this way, but Windows tablet mode,
 is not. Figuring out what happened to the application that was just open is confusing, and
 the home page is a busy mess. When I used a two-in-one (a Lenovo Yoga), I would just have it never enter tablet 
 mode as I found it too annoying. 

 The other major issue with Windows as a tablet is that its applications are simply not optimized to run on a tablet.
 The designs are not responsive or are too reliant on having a keyboard and mouse. An ideal two in one would allow 
 you to use purpose built mobile applications alongside desktop applications. 

 {% include responsive-image.html src='/assets/img/surface-linux/tablet_mode.jpg' alt='Windows Computer in Tablet Mode. Photo by Felix Wong' %}

## Installing Linux on a Surface Device

The solution, at least for me, was to install some flavor of linux on a Surface Pro and to run Waydroid on it, allowing me
to install Android applications. Linux offers a huge variety of desktop environments and extensions which I can use to customize
how I interact with the operating system, and Waydroid means that I can install and use purpose built mobile applications that 
are meant to be interacted with on a tablet. 

The Surface Pro 1-9 all used Intel based processors and the [Linux Surface](https://github.com/linux-surface/linux-surface) project 
includes kernel extensions for getting all the Surface hardware to work with Linux, including the touch screen,
type cover, and stylus. The newest Surface Pro 11 use Snapdragon X Elite processor, which is impressive,
but which, as of October 2025, does not have great Linux support ([Ubuntu 20.05 has some support, although not for the Surface Pro 10](https://discourse.ubuntu.com/t/faq-ubuntu-25-04-on-snapdragon-x-elite/61016)).
