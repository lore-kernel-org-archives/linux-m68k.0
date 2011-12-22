From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: Porting m68k/nommu to a new board.
Date: Thu, 22 Dec 2011 17:22:48 +1000
Message-ID: <4EF2DAC8.3060409@snapgear.com>
References: <201112152137.29195.me@danielpalmer.co.uk> <CAMuHMdU+VCVxnawb8DHmZp1EfBGW6T5D0WyXRXpo8bj1bJZ+pg@mail.gmail.com> <4EEB23FD.9090904@snapgear.com> <201112181824.56271.me@danielpalmer.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:22719 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752288Ab1LVH0b (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Dec 2011 02:26:31 -0500
In-Reply-To: <201112181824.56271.me@danielpalmer.co.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Daniel Palmer <me@danielpalmer.co.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>

Hi Daniel,

On 19/12/11 12:24, Daniel Palmer wrote:
> Sorry for not replying sooner. Too much work :(
>
>> I run on ColdFire parts all the time. Right up to 3.2-rc5 :-)
>> It works great. But I don't have or regularly use any original m68k
>> core hardware. I occasionally compile for the 68328 target, so it
>> will compile, can't be sure if it still runs though.
>
> I did a bit of poking around, I couldn't get the 68328 target to build.. I was
> going to have a play with it in xcopilot. It complains about some linker

Yep, a couple of issues when building for the Palm/Pilot.
I just sent a couple of patches to m68k-linux that fix the main
problems. You will also want to disable CONFIG_FW_LOADER if you
have that enabled.

After that I can compile it all the way (I am building on 3.2-rc6).
No idea if it works though.

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
