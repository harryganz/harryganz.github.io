---
title: Running Linux on a Surface Device
layout: post
---

When I saw the original Microsoft Surface I immediately though that it was the ideal laptop + tablet, 2-in-1 format: a perfect balance of power and portability. It had one problem, though. It ran Windows. It has been a decade, but I finally decided to get a Surface and turn it into the perfect, portable Linux 2-in-1 that I had always dreamed of.

## The Hardware

The Surface name has branched out a bit into a set of only somewhat related devices, so I would
like to specify that I am talking about the Microsoft Surface Pro line of hyper portable,
2-in-1 devices. These devices originally had Intel i3/i5/i7 processors, with the newest
devices (10/11) having Snapdragon X Pro and X Elite CPUs. 
The hardware has always been an impressive amount of processing power in an incredibly
thin 12 or 13 inch. tablet. Microsoft also put a lot of thought into ergonomics, 
with a fairly unique kickstand to keep the tablet at various angles and a detachable 
keyboard and stylus. The keyboard (called a Type Cover) is worth talking about, as,
from the very start, it was well designed to both fold over the screen for transport,
as well as be detachable, making the Surface a "true" tablet. 
The more premium Alcantra Type Covers look nice and have decent keys with a surprising amount
of travel and feedback for such a thin keyboard. 

The downside the Surface hardware, at least historically, is that it's battery life has never been great. 
Not surprising given the use of modified i-series Intel chips, but a hyper portable device with only 3-4 hours of 
use is not amazing, at least not anymore. I think that the use of mobile optimized Snapdragon chips would fix that
in the 10/11 series, but there is a reason that I cannot test that for myself, which I will get to.

Overall, I think that the Surface is the best possible hardware for a 2-in-1 that I have ever seen, 
and it is still shocking to me how niche it is as a device, and that competitors only occasionally try to 
rip it off (the Dell Latitude 7350, Asus Pro Art PZ13, and Lenovo X12 Gen 2 being counterexamples).

{% include responsive-image.html src='/assets/img/surface-linux/Surface_Pro_9_in_Sapphire_colour.jpg'
 alt='Surface Pro 9 in Sapphire Color with Type Cover. Photo by Kyler Chin' %}

## The Problem with Windows

 The problem with the Surface Pro is software. That is not to say that Windows is a bad operating system. There 
 are plenty of Linux purists who will dump on Windows for any and all reasons, but I am not among them.
 Windows is a decent desktop environment with a UX that is very easy for people familiar with it to use. 
 Sure, it didn't have an officially supported package manager until far too recently (2020), and its
 default terminal is not POSIX compliant, but, for most people that is not very important. The real problem
 with using Windows in a 2-in-1 is that the operating system and all of its software is designed for 
 desktop, and tablet mode doesn't do enough to address it. 

 In my opinion, the perfect tablet interface runs a single application at a time with previously
 used applications fading into the background but easy to access. It also has a customizable home screen with
 gestures to access a list of all applications. Both iOS and Android are arranged this way, but Windows tablet mode,
 is not. Figuring out what happened to the application that was just open is confusing, and
 the home page is a busy mess. When I used a 2-in-1 (a Lenovo Yoga), I would just have it never enter tablet 
 mode as I found it too annoying. 

 The other major issue with Windows as a tablet is that its applications are simply not optimized to run on a tablet.
 The designs are not responsive or are too reliant on having a keyboard and mouse. An ideal two in one would allow 
 you to use purpose built mobile applications alongside desktop applications. 

 {% include responsive-image.html src='/assets/img/surface-linux/tablet_mode.jpg' alt='Windows Computer in Tablet Mode. Photo by Felix Wong' %}

## Installing Linux on a Surface Device

The solution, at least for me, was to install some flavor of Linux on a Surface Pro and to run Waydroid on it, allowing me
to install Android applications. Linux offers a huge variety of desktop environments and extensions which I can use to customize
how I interact with the operating system, and Waydroid means that I can install and use purpose built mobile applications that 
are meant to be interacted with on a tablet. 

The Surface Pro series 1 go 9 all used Intel based processors and the [Linux Surface](https://github.com/Linux-surface/Linux-surface) project 
includes kernel extensions for getting all the Surface hardware to work with Linux, including the touch screen,
type cover, and stylus. The newest Surface Pro 11 use Snapdragon X Elite processor, which is impressive,
but which, as of October 2025, does not have great Linux support ([Ubuntu 20.05 has some support, although not for the Surface Pro 10](https://discourse.ubuntu.com/t/faq-ubuntu-25-04-on-snapdragon-x-elite/61016)).

With this information, I decided to find a used Surface Pro on eBay and install Fedora with a GNOME desktop environment. I 
found a Surface 7 for less than $200, with Type Cover and Stylus included. There were Surface Pro 9s selling for around $700, 
but I decided that if I were going to get something used, it might as well be cheap. When the Snapdragon CPUs get better Linux
support, I will probably get a new Surface Pro one and replace the OS with Linux. 

Installing Fedora on the Surface device was extremely straightforward. I [downloaded the workstation ISO](https://fedoraproject.org/workstation/download)
for x86 CPUs, used the fedora-provided media writer, and followed the directions (e.g. disable secure boot, boot from USB, etc.). I chose not to keep
a windows partition, but I think it would have been fairly easy to do that as well. The only catch is that, until I installed the surface kernel extensions, 
I needed to use a USB keyboard and mouse as the touchscreen and detachable keyboard drivers are not included in the Linux kernel, by default. 

Next, I installed the [surface kernel](https://github.com/Linux-surface/Linux-surface) via the package manager,
which provides hardware support for surface devices. This allowed me to use the Type Cover, touchscreen, and even
the stylus. The only issue that I had with the installation was that I could not re-enable secure boot. When I tried it would 
kick me back to the boot options screen. I suspect that I needed to update the firmware to install newer certificates, but I
didn't really care enough to do that.


## Adding software

My goal with the surface was to use it as a combination media playing tablet and development device. Here is what I wanted:

1. Install Waydroid so that I could run Android apps on the device
2. Install Netflix and Disney Plus Android apps with the ability to download shows/movies
4. Get NeoVim working with my LSP config
5. Install Docker
6. Install Steam


I expected some issues, but I was pleasantly surprised by how few issues I ran into. 

**Waydroid:**

[Waydoid](https://waydro.id/#install) is an Android emulator that runs on Linux, it was 
very easy to install by following the directions. Because I wanted to install apps from 
the Play app, I needed to follow [their documentation](https://docs.waydro.id/faq/google-play-certification) on 
adding the device to a list of authorized devices for my Google account and then switch to the GAPPS version of 
Waydroid.

**Netflix:**

When I first installed Netflix, I was met with my first issue, an "Unable to Connect to Netflix" error. That was
pretty simple to fix. I just needed to add [Widevine DRM](https://github.com/waydroid_script#integrate-widevine-drm-I3).
It would be nice if the error said something about needing DRM, but enough people ran into this issue that a quick
google search led me to the answer.

**Disney Plus:**

Installing Disney Plus was a complete failure. Disney has a whitelist of allowed devices which doesn't include 
Waydroid. Perhaps there was a way to spoof the device ID or to find a shady APK, but I didn't bother. I might
try again if I go on a trip and need to download some Disney shows for my son.

**Neovim:**

Getting NeoVim working was basically the same as on any Linux device. There was some pain in downloading all the
dependencies for the various languages I use (Ruby is always a pain), but once I got them installed, the LSPs worked
as expected and without any noticeable lag. [Here is a link to my NeoVim config](https://github.com/harryganz/nvim),
if you are interested.

**Docker:**

Docker was an interesting challenge. I expected it to be straightforward, and it was, but then something weird happened. 
I installed the Docker client and daemon using the [instructions on the Docker website](https://docs.docker.com/desktop/setup/install/Linux/fedora/)
and was able to build docker containers from Dockerfiles, but then something strange happened: my Waydroid container could 
no longer connect to the internet. At first, I thought it was because I had updated software on my device, but it became
clear that there was some sort of contention with port usage. Apparently, [Docker creates firewall rules that block 
forwarding on ports used by Waydroid](https://github.com/waydroid/waydroid/issues/509). It took me far too long to figure 
out what the heck was happening, but when I did, I decided that Docker was the problem, and used [podman](https://podman.io/)
instead. You can still use Docker (look at the [linked Github issue](https://github.com/waydroid/waydroid/issues/509)), but
it requires changing how Waydroid is installed, and I thought that it was more of a headache than just using a Docker competitor.

**Steam:**

Installing steam was sort of a joke on my part. I really didn't need to game on a five year old Surface Pro 7, but the 
idea of using a Windows device to run Linux to emulate Windows to play a game sounded like an interesting problem, and
I wondered whether it would work. In short: Yes! It was actually extremely simple. I just found steam in the app installer UI,
clicked install and it just worked. I got KSP running with about 30fps and medium settings. I doubt it could run anything 
super GPU intensive, but for casual gaming it works fine. I also installed some emulators to play old SNES/N64/DOS games, 
and those also worked well. It seems that it can indeed run Doom.


## Impressions and Next Steps

Overall, I am really pleased with my decision to go install Linux on a Surface device. Between getting a brand new
Surface Pro 11 and only running windows, buying something like a PineTab or Starlite tablet, or getting a used Surface Pro and 
installing Linux, I think I made the correct choice for my intended use.
Having the ability to install Android apps is a game changer, and I can customize the desktop environment however I like.

I have done a bit of customization already, adding GNOME extensions which maximize windows on open and move new windows
to their own workspace, but I might customize it a bit more. I want to tweak power usage and see if I can figure a way
to reduce resources from background applications. 

The only thing I really wish were better is battery life. It lasts about 3-4 hrs under normal usage (e.g. playing 
video). Running a game on it drains the battery much faster, so it is not exactly a portable gaming machine. 

In a few years, when Linux has better support for Snapdragon CPUs, I will probably upgrade and, hopefully, even
that gap will be filled.

