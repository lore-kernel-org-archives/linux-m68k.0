From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [-next] FATAL: drivers/gpu/drm/udl/udl: sizeof(struct usb_device_id)=24 is not a modulo of the size of section __mod_usb_device_table=44.
Date: Sun, 17 Jun 2012 16:00:57 +0200
Message-ID: <87fw9urqau.fsf@nemi.mork.no>
References: <CAMuHMdXk6pByz14JcDgY+UE6QM0sHD8cbXye9CgOVSRRtr7J+Q@mail.gmail.com>
	<20120615201021.GB14544@kroah.com>
	<CAMuHMdUj6tAcWhkSkV43Kw3-2-3+JzgP6W=2w3fjL2KBfRh9ZQ@mail.gmail.com>
	<20120615231220.GC8205@kroah.com> <87lijns84s.fsf@nemi.mork.no>
	<m2bokjb6tv.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <m2bokjb6tv.fsf@igel.home> (Andreas Schwab's message of "Sat, 16
	Jun 2012 17:43:40 +0200")
Sender: linux-kbuild-owner@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, USB list <linux-usb@vger.kernel.org>, linux-kernel@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Andreas Schwab <schwab@linux-m68k.org> writes:
> Bj=C3=B8rn Mork <bjorn@mork.no> writes:
>
>> AFAIK (which admittedly is not much wrt cross building) there is no =
way
>> we can make the host built file2alias know the proper aligment for t=
he
>> structure in the target built modules.  That's the background for th=
is
>> fix:=20
>>
>> commit 4ce6efed48d736e3384c39ff87bda723e1f8e041
>> Author: Sam Ravnborg <sam@uranus.ravnborg.org>
>> Date:   Sun Mar 23 21:38:54 2008 +0100
>>
>>     kbuild: soften modpost checks when doing cross builds
>
> This is not a fix in any sense of the word.  modpost can only work
> properly if its view of the device_id structures matches *exactly* th=
at
> of the target.

You are absolutely correct, of course.  I am starting to believe Greg i=
s
correct.  Cross building works mostly by pure luck :-)

I found that the reason the change I referred to above didn't kick in
was because CONFIG_DEBUG_SECTION_MISMATCH was set, causing modpost to b=
e
called from scripts/Makefile.build without the "-c" option:

 # Do section mismatch analysis for each module/built-in.o
 ifdef CONFIG_DEBUG_SECTION_MISMATCH
   cmd_secanalysis =3D ; scripts/mod/modpost $@
 endif


But as you point out: The whole "soften modpost check" concept is bogus=
=2E
It just cannot work.  And I just verified it doing a m68k allmodconfig
build without CONFIG_DEBUG_SECTION_MISMATCH.  modpost will bail out
unless host and target aligment matches:

  scripts/mod/modpost -m -a -o /usr/local/src/build-tmp/linux/Module.sy=
mvers    -S  -c -s
drivers/media/video/gspca/gspca_sunplus: struct usb_device_id is 24 byt=
es.  The last of 55 is:
0x04 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0=
x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00=20
=46ATAL: drivers/media/video/gspca/gspca_sunplus: struct usb_device_id =
is not terminated with a NULL entry!
make[1]: *** [__modpost] Error 1
make: *** [modules] Error 2


So the prosed fix from Greg is certainly the correct one, until someone
rewrites modpost to be completely cross build safe.


Bj=C3=B8rn
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
