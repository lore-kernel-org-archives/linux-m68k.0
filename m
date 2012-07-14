From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: atafb and X/fbdev
Date: Sat, 14 Jul 2012 15:42:42 +1200
Message-ID: <5000EAB2.4080900@gmail.com>
References: <Pine.BSM.4.64L.1207062301330.12225@herc.mirbsd.org>	<4FF7AFD7.8000005@biophys.uni-duesseldorf.de>	<Pine.BSM.4.64L.1207070751590.7146@herc.mirbsd.org>	<CAMuHMdW1Gigu0642GuXHGyOmghDLkndboTKyGt=z=zDgWcNWFw@mail.gmail.com>	<Pine.BSM.4.64L.1207070912580.7146@herc.mirbsd.org>	<Pine.BSM.4.64L.1207071537230.13285@herc.mirbsd.org>	<4FF90ECF.2090001@gmail.com> <CAOmrzk+uSw+o1rzoZP5Xz5usFwYm1Fc8-0-dJRq+uh6dV4La8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090606090602090501020407"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:56101 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757870Ab2GNDmw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 13 Jul 2012 23:42:52 -0400
Received: by pbbrp8 with SMTP id rp8so6503551pbb.19
        for <linux-m68k@vger.kernel.org>; Fri, 13 Jul 2012 20:42:52 -0700 (PDT)
In-Reply-To: <CAOmrzk+uSw+o1rzoZP5Xz5usFwYm1Fc8-0-dJRq+uh6dV4La8Q@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, debian m68k <debian-68k@lists.debian.org>

This is a multi-part message in MIME format.
--------------090606090602090501020407
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thorsten,
>> There is a 16 bpp mode - look for 'hicolor' in the source. From my
>> understanding,
>> it has all been wired up right (to be honest, I did only rewrite the fbcon
>> interface
>> for 2.6 onwards, and touched as little of the business end of the driver as
>> possible).
>>     
>
> The mode is named TrueColor in GEM - I just cannot seem to chose it.
> Any hints welcome.
>
>   
Anyone? Do I need special hardware (external pixel clock generation?) to 
use the truecolor mode?
> If all else fails I'll hack a truecolor command line option into atafb :-)
>   
I've played with the framebuffer timing calculations a bit - 16 bpp 
appears to require unreasonably
low hsync frequency in order to keep within the available video 
bandwidth of 32 MHz.

The attached patch should allow you to use the 16bpp mode in ARAnyM. 
video=atafb:truecolor
together with stram_pool=2048k should get you there.

fbset could be used to switch depths on the fly if you don't want to use 
it all the time.

For real existing hardware, I fear 8 bit VGA mode is the best we can do.

Cheers,

    Michael




--------------090606090602090501020407
Content-Type: text/x-patch;
 name="atafb-truecolor.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="atafb-truecolor.diff"

commit cb0ac57a4163fba7a3e73ff613670dc5792fb5b6
Author: schmitz <schmitz@michael.waratah.dyndns.org>
Date:   Sat Jul 14 15:26:25 2012 +1200

    [m68k] Atari: experimental truecolor support for atafb (ARAnyM only!)

diff --git a/drivers/video/atafb.c b/drivers/video/atafb.c
index 64e41f5..71f9279 100644
--- a/drivers/video/atafb.c
+++ b/drivers/video/atafb.c
@@ -409,6 +409,7 @@ static char *vga16_names[] = { "vga16", "default3", NULL };
 static char *vga256_names[] = { "vga256", NULL };
 static char *falh2_names[] = { "falh2", NULL };
 static char *falh16_names[] = { "falh16", NULL };
+static char *truecol_names[] = { "truecolor", NULL };
 
 static char **fb_var_names[] = {
 	autodetect_names,
@@ -424,6 +425,7 @@ static char **fb_var_names[] = {
 	vga256_names,
 	falh2_names,
 	falh16_names,
+	truecol_names,
 	NULL
 };
 
@@ -483,6 +485,10 @@ static struct fb_var_screeninfo atafb_predefined[] = {
 	  896, 608, 896, 0, 0, 0, 4, 0,
 	  {0, 6, 0}, {0, 6, 0}, {0, 6, 0}, {0, 0, 0},
 	  0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0 },
+	{ /* truecolor */
+	  640, 480, 640, 0, 0, 0, 16, 0,
+	  {0, 5, 0}, {0, 6, 0}, {0, 5, 0}, {0, 0, 0},
+	  0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0 },
 };
 
 static int num_atafb_predefined = ARRAY_SIZE(atafb_predefined);
@@ -547,6 +553,14 @@ static struct fb_videomode atafb_modedb[] __initdata = {
 		"falh", 60, 896, 608, 32000, 18, 42, 31, 1, 96,3,
 		0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
 	},
+
+	{
+		/* 640x400, 31 kHz, 70 Hz (VGA) */
+		"truecolor", 70, 640, 400, 32000, 18, 42, 31, 11, 96, 3,
+		FB_SYNC_VERT_HIGH_ACT | FB_SYNC_COMP_HIGH_ACT, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
+	},
+
+
 };
 
 #define NUM_TOTAL_MODES  ARRAY_SIZE(atafb_modedb)
@@ -1181,8 +1195,13 @@ static int falcon_decode_var(struct fb_var_screeninfo *var,
 	}
 	/* Is video bus bandwidth (32MB/s) too low for this resolution? */
 	/* this is definitely wrong if bus clock != 32MHz */
-	if (pclock->f / plen / 8 * bpp > 32000000L)
-		return -EINVAL;
+	if (bpp == 16) {
+		if (pclock->f / plen / 16 * bpp > 32000000L)
+			return -EINVAL;
+	} else {
+		if (pclock->f / plen / 8 * bpp > 32000000L)
+			return -EINVAL;
+	}
 
 	if (vsync_len < 1)
 		vsync_len = 1;
@@ -3147,7 +3166,7 @@ int __init atafb_init(void)
 	/* Multisync monitor capabilities */
 	/* Atari-TOS defaults if no boot option present */
 	if (fb_info.monspecs.hfmin == 0) {
-		fb_info.monspecs.hfmin = 31000;
+		fb_info.monspecs.hfmin = 16000;
 		fb_info.monspecs.hfmax = 32000;
 		fb_info.monspecs.vfmin = 58;
 		fb_info.monspecs.vfmax = 62;

--------------090606090602090501020407--
