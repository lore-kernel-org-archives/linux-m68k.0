From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [-next] FATAL: drivers/gpu/drm/udl/udl: sizeof(struct usb_device_id)=24 is not a modulo of the size of section __mod_usb_device_table=44.
Date: Sat, 16 Jun 2012 17:43:40 +0200
Message-ID: <m2bokjb6tv.fsf@igel.home>
References: <CAMuHMdXk6pByz14JcDgY+UE6QM0sHD8cbXye9CgOVSRRtr7J+Q@mail.gmail.com>
	<20120615201021.GB14544@kroah.com>
	<CAMuHMdUj6tAcWhkSkV43Kw3-2-3+JzgP6W=2w3fjL2KBfRh9ZQ@mail.gmail.com>
	<20120615231220.GC8205@kroah.com> <87lijns84s.fsf@nemi.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <87lijns84s.fsf@nemi.mork.no> (=?utf-8?Q?=22Bj=C3=B8rn?=
 Mork"'s message of "Sat, 16
	Jun 2012 15:23:31 +0200")
Sender: linux-kbuild-owner@vger.kernel.org
To: =?utf-8?Q?Bj=C3=B8rn?= Mork <bjorn@mork.no>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, USB list <linux-usb@vger.kernel.org>, linux-kernel@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Bj=C3=B8rn Mork <bjorn@mork.no> writes:

> AFAIK (which admittedly is not much wrt cross building) there is no w=
ay
> we can make the host built file2alias know the proper aligment for th=
e
> structure in the target built modules.  That's the background for thi=
s
> fix:=20
>
> commit 4ce6efed48d736e3384c39ff87bda723e1f8e041
> Author: Sam Ravnborg <sam@uranus.ravnborg.org>
> Date:   Sun Mar 23 21:38:54 2008 +0100
>
>     kbuild: soften modpost checks when doing cross builds

This is not a fix in any sense of the word.  modpost can only work
properly if its view of the device_id structures matches *exactly* that
of the target.

Andreas.

--=20
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint =3D 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4=
ED5
"And now for something completely different."
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
