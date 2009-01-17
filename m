From: Emmanuel Vasilakis <evas@agn.forthnet.gr>
Subject: Re: cirrusfb not working?
Date: Sat, 17 Jan 2009 12:30:24 +0200
Message-ID: <4971B340.2070604@agn.forthnet.gr>
References: <49706C81.7000905@agn.forthnet.gr> <8259f0250901161011t24eb0351l6b39739f0a20179@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx-out.forthnet.gr ([193.92.150.104]:58054 "EHLO
	mx-out.forthnet.gr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752570AbZAQKah (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 17 Jan 2009 05:30:37 -0500
In-Reply-To: <8259f0250901161011t24eb0351l6b39739f0a20179@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: mike <localgost@gmail.com>
Cc: linux-m68k@vger.kernel.org

Hi Mike,

mike wrote:
> Try cirrusfb:640x480 or something
> 
> 
> Default video modes
> -------------------
> At the moment, there are two kernel command line arguments supported:
> 
> mode:640x480
> mode:800x600
> 	or
> mode:1024x768
> 
> Full support for startup video modes (modedb) will be integrated soon.
> 

Did try those opts, and everything else I could think off. No go.

Am I supposed to see the kernel booting in that resolution, or will it 
first boot and switch to picasso when the cirrusfb module is loaded?

My exact amiboot line is:

1> amiboot -k vmlinuz video=cirrusfb:640x480

Thanks!


