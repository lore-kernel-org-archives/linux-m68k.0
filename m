From: mike <localgost@gmail.com>
Subject: Re: bogl: don't know screen type 1
Date: Tue, 1 Sep 2009 00:16:27 +0200
Message-ID: <8259f0250908311516r49e54c7fi44ead0f040cade30@mail.gmail.com>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com>
	 <20090831120617.GA1114@marenka.net>
	 <8259f0250908310558l3ddd5fam7d15946a7c1e8572@mail.gmail.com>
	 <8259f0250908311511h77270544vb2dc3dd383f1add8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f219.google.com ([209.85.218.219]:63701 "EHLO
	mail-bw0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751041AbZHaWQ0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Aug 2009 18:16:26 -0400
Received: by bwz19 with SMTP id 19so3111148bwz.37
        for <linux-m68k@vger.kernel.org>; Mon, 31 Aug 2009 15:16:27 -0700 (PDT)
In-Reply-To: <8259f0250908311511h77270544vb2dc3dd383f1add8@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: mike <localgost@gmail.com>, linux-m68k@vger.kernel.org

Btw, i noticed an error
http://people.debian.org/~smarenka/d-i/m68k/images/daily/build_nativehd=
=2Elog
E: Couldn't find package libnss-dns-udeb
make[2]: *** [stamps/get_udebs-nativehd-stamp] Error 100
make[1]: *** [_build] Error 2
make: *** [build_nativehd] Error 2


2009/9/1 mike <localgost@gmail.com>:
> debian-installer/framebuffer=3Dfalse
> ; Stephen R. Marenka, 16 Aug 2004
> ; nolangchooser replaced with debian-installer/framebuffer=3Dfalse
>
> amiboot-5.6 -d -k //kernels/vmlinuz-2.4.27-amiga -r //cdrom/initrd.gz
> root=3D/dev/ram ramdisk_size=3D15000 debian-installer/framebuffer=3Df=
alse
>
> Thanks Stephen :D
>
>
> 2009/8/31 mike <localgost@gmail.com>:
>> Hi,
>>
>> Tested that to, its just a modified StartInstall file. i believe i
>> adjusted the fb=3D last time around, but to what i dont know. it doe=
s
>> work with 2.6, however i cant find any 1. cd isos i can download apa=
rt
>> from 3.1r8. Last time i installed from a iso image on the hard drive=
,
>> i even tracked down the loop.ko from my previous installation. (i
>> think and hope)
>>
>> Thanks.
>>
>> -Mike
>>
>> 2009/8/31 Stephen R Marenka <stephen@marenka.net>:
>>> On Mon, Aug 31, 2009 at 05:28:50AM +0200, mike wrote:
>>>> Hi,
>>>>
>>>> Decided to reinstall linux, but this error haunts me.
>>>> Adding nolangchooser didnt help.
>>>>
>>>> My boot file looks like this
>>>> amiboot -d -m mfile -k vmlinuz-2.4.27-amiga -r initrd.gz root=3D/d=
ev/ram
>>>> video=3Damifb:pal-lace
>>>>
>>>> Tried pretty much everything, it seems to die around the kbd choos=
er,
>>>> so i added bootkbd=3Dquerty/us.
>>>> This resulted in a segmentation fault before the bogl'ing started.=
 By
>>>> the life of my i cant remember what i did last time.... But im pre=
tty
>>>> sure i didnt add nolangchooser.
>>>
>>> I believe you want to add the parameter fb=3Dfalse to your kernel
>>> parameters. bogl is a graphics library that assumes kernel support
>>> that amiga doesn't have. fb=3Dfalse tells d-i to not go there.
>>>
>>> 2.4.27 hasn't been tested with d-i in quite some time, at least not=
 by me.
>>>
>>> Peace,
>>>
>>> Stephen
>>>
>>> --
>>> Stephen R. Marenka =C2=A0 =C2=A0 If life's not fun, you're not doin=
g it right!
>>> <stephen@marenka.net>
>>>
>>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
