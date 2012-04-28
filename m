From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 1/1] Changes for 68000 code integration.
Date: Sat, 28 Apr 2012 23:02:02 +1000
Message-ID: <4F9BEA4A.8090802@snapgear.com>
References: <1335481717-8652-1-git-send-email-ljalvs@gmail.com> <4F9AA7DD.2020501@snapgear.com> <CAGj5WxBNxkXdS8atb-WVwWR5QLWPS6wreDnmpwaZLa=PzE6cNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:35574 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751905Ab2D1NCJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 28 Apr 2012 09:02:09 -0400
In-Reply-To: <CAGj5WxBNxkXdS8atb-WVwWR5QLWPS6wreDnmpwaZLa=PzE6cNw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Luis Alves <ljalvs@gmail.com>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, gerg@uclinux.org

Hi Luis,

On 04/28/2012 12:30 AM, Luis Alves wrote:
> On Fri, Apr 27, 2012 at 3:06 PM, Greg Ungerer<gerg@snapgear.com>  wro=
te:
>> On 04/27/2012 09:08 AM, Luis Alves wrote:
>>> This is the first of a pack of patches to support the original 6800=
0 cpu.
>>> This adds:
>>> =C3=A1-MC68000 cpu as a choice in the config menu.
>>> =C3=A1-Alcetronics M68K board (uses this cpu).
>>>
>>> What I have changed:
>>> =C3=A1-CONFIG_M68000 was being used by 68328 CPUs.
>>> =C3=A1 Renamed to CONFIG_M68XXX. Now the 68000 and all CPU32 CPUs u=
se this flag
>>> for common configurations.
>>> =C3=A1-Modified all 68[VZ|EZ]328 to select CONFIG_MCPU32
>>> =C3=A1-Modified CONFIG_MCPU32 to select CONFIG_M68XXX.
>>> =C3=A1-Modified CONFIG_M68360 to select CONFIG_M68XXX (I think it w=
as missing
>>> some settings).
>>> =C3=A1-Modified some files to use CONFIG_M68XXX instead of
>>> CONFIG_M68000/CONFIG_MCPU32
>>
>>
>> Thinking on this a little more, you probably don't want most of
>> these changes. Certainly as Brad points out CPU32 and 68000 are
>> quite different, and they need to remain as separate config options.
>>
>> I can see you will end up with a arch/m68k/platform/68000 with
>> some new code. Is any of that common with what is currently in
>> arch/m68k/platform/68328? =C3=A1I would expect we want to move the
>> common 68000 code into that platform/68000 directory. Longer
>> term we may want to do away with 68328/68EZ328/68VZ328 directories
>> all together. All the code may go in a platform/68000. (Still
>> thinking this one over though, but I am planning on doing away
>> with the separate 5xxx ColdFire directories real soon now).
>>
>
> I think this is a good idea. Do you suggest putting all together in t=
he
> same file and use #ifdef's for cpu specific options? I could do that.

That may or may not make sense, we need to think about each case.
Hopefully we can keep common code together with minimal additional
#ifdefs. And put board (or on/off chip peripherals) in there own
files.


> Also, how to deal with board specific configuration files?
> As I referred in the previous mail, the 68000 has zero on-chip periph=
erals
> so the initial setup and configuration is a lot 'board-dependent'.

Yep. The best case is if you have specific configuration files
separate, and built based on their appropriate defines in the Makefile.
(See examples in arch/m68k/platform/coldfire/Makefile).

To start I would just put them all in the common 68000 sub-directory.
If the need arises we can start putting machine specific sub-directorie=
s
later (which is what we have at the top arch level, arch/m68k/). For
quite a few years we had machine specific directories under
platform/coldfire. But I gave up on it eventually - there was just so
much duplicated code it didn't seem to make any sense.

Regards
Greg



-----------------------------------------------------------------------=
-
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.co=
m
SnapGear Group, McAfee                      PHONE:       +61 7 3435 288=
8
8 Gardner Close,                            FAX:         +61 7 3891 363=
0
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m
