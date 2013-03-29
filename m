From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream
 and debian-kernel
Date: Fri, 29 Mar 2013 20:33:23 +0100
Message-ID: <20130329193323.GD14587@chumley.earth.sol>
References: <Pine.BSM.4.64L.1303251751380.27649@herc.mirbsd.org>
 <51515889.6040106@uter.be>
 <5152996E.50800@gmail.com>
 <20130328211747.GA10917@chumley.earth.sol>
 <5154C5E0.3040608@gmail.com>
 <20130328231039.GA14587@chumley.earth.sol>
 <CAMuHMdWxCW0Gp8jYYk7R3WDJ8u-LJBZJ5d9jjaPAf27vXv3jDA@mail.gmail.com>
 <20130329080629.GB14587@chumley.earth.sol>
 <CAMuHMdXcy8Apvm58m4XudxfRTRa9aiTojRVanPtY3M=mTUUxqg@mail.gmail.com>
 <5155E1A3.7060307@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-in-13.arcor-online.net ([151.189.21.53]:54382 "EHLO
	mail-in-13.arcor-online.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756616Ab3C2TdZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Fri, 29 Mar 2013 15:33:25 -0400
Content-Disposition: inline
In-Reply-To: <5155E1A3.7060307@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Wouter Verhelst <w@uter.be>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org, Ingo J?rgensmann <ij@2012.bluespice.org>

On Sat, Mar 30, 2013 at 07:46:59AM +1300, Michael Schmitz wrote:
> Explicitly allowed (and preferred) for that purpose (and a few
> select other uses).
> Nesting of if () else () branches for error unwinding would
> otherwise look silly.
> 
> There's still some Real Programmers (Tm) out there :-)

I think that goto could be easily avoided... but I am not a Real Programmer
and this is getting off-topic.

I managed to build an amiga kernel from linux-source-3.8 (in experimental)
with this command:

make KBUILD_DEBARCH=m68k ARCH=m68k CROSS_COMPILE=m68k-linux-gnu- deb-pkg

after applying a little patch:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=704223

The vmlinuz file is neither stripped nor compressed, but after stripping it,
it boots on the Amiga without a memfile (I removed unneeded video and
network drivers and some other things).

I think the first part is needed for building deb packages on m68k:

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index acb8650..73b6088 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -28,7 +28,7 @@ create_package() {
        # Attempt to find the correct Debian architecture
        local forcearch="" debarch=""
        case "$UTS_MACHINE" in
-       i386|ia64|alpha)
+       i386|ia64|alpha|m68k)
                debarch="$UTS_MACHINE" ;;
        x86_64)
                debarch=amd64 ;;

The second part seems is needed for cross-compiling, this one works:
https://patchwork.kernel.org/patch/752622/

With this is should be easy to (cross-) build kernel-images for m68k with
additional patches and minimized config, since this does not use Debian's
gencontrol.py. Maybe I will try to understand that later.

Christian
