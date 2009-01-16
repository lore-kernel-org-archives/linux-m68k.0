From: mike <localgost@gmail.com>
Subject: Re: cirrusfb not working?
Date: Fri, 16 Jan 2009 19:11:26 +0100
Message-ID: <8259f0250901161011t24eb0351l6b39739f0a20179@mail.gmail.com>
References: <49706C81.7000905@agn.forthnet.gr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.159]:20052 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S936647AbZAPSL3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Jan 2009 13:11:29 -0500
Received: by fg-out-1718.google.com with SMTP id 19so874495fgg.17
        for <linux-m68k@vger.kernel.org>; Fri, 16 Jan 2009 10:11:26 -0800 (PST)
In-Reply-To: <49706C81.7000905@agn.forthnet.gr>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Emmanouel Vasilakis <evas@agn.forthnet.gr>
Cc: linux-m68k@vger.kernel.org

Try cirrusfb:640x480 or something


Default video modes
-------------------
At the moment, there are two kernel command line arguments supported:

mode:640x480
mode:800x600
	or
mode:1024x768

Full support for startup video modes (modedb) will be integrated soon.


2009/1/16 Emmanouel Vasilakis <evas@agn.forthnet.gr>:
> Hi,
>
> I was trying a few days ago to boot a recent 2.6 kernel on my Amiga 3000.
>
> From what I found online, in order to get a framebuffer display from my
> Picasso IV, I needed to use the cirrusfb driver to the kernel which replaced
> the older clgen driver (In latest 2.6 kernels).
>
> I tried stuff like:
>
> amiboot -k vmlinuz video=cirrusfb:
>
> No matter what I append to the video parameter, I can never get a display
> from the graphics card, it always comes up from the native ECS. Kernel
> messages say that a cirrusfb supported card was found. I was then told that
> cirrusfb does not work as expected, so any information on that?
>
> What eventually worked somehow, was: video=amifb:off, which produced a
> display from the Picasso, but was full of garbage.
>
> Thanks,
> Emmanuel
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
