From: mike <localgost@gmail.com>
Subject: Re: cirrusfb not working?
Date: Sun, 18 Jan 2009 03:25:05 +0100
Message-ID: <8259f0250901171825q3e7ef5b0oafdb1bcf1a7638f4@mail.gmail.com>
References: <49706C81.7000905@agn.forthnet.gr>
	 <8259f0250901161011t24eb0351l6b39739f0a20179@mail.gmail.com>
	 <4971B340.2070604@agn.forthnet.gr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.152]:12320 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753344AbZARCZG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 17 Jan 2009 21:25:06 -0500
Received: by fg-out-1718.google.com with SMTP id 19so1076613fgg.17
        for <linux-m68k@vger.kernel.org>; Sat, 17 Jan 2009 18:25:05 -0800 (PST)
In-Reply-To: <4971B340.2070604@agn.forthnet.gr>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Emmanuel Vasilakis <evas@agn.forthnet.gr>
Cc: linux-m68k@vger.kernel.org

Hm, im out of ideas, you could try 2.8.28, i uploaded it to aminet a
few days ago, but something tells me that wont make any difference. If
that doesnt work, try 2.4, and if that works, holler.

-Mike

2009/1/17 Emmanuel Vasilakis <evas@agn.forthnet.gr>:
> Hi Mike,
>
> mike wrote:
>>
>> Try cirrusfb:640x480 or something
>>
>>
>> Default video modes
>> -------------------
>> At the moment, there are two kernel command line arguments supported:
>>
>> mode:640x480
>> mode:800x600
>>        or
>> mode:1024x768
>>
>> Full support for startup video modes (modedb) will be integrated soon.
>>
>
> Did try those opts, and everything else I could think off. No go.
>
> Am I supposed to see the kernel booting in that resolution, or will it first
> boot and switch to picasso when the cirrusfb module is loaded?
>
> My exact amiboot line is:
>
> 1> amiboot -k vmlinuz video=cirrusfb:640x480
>
> Thanks!
>
>
>
