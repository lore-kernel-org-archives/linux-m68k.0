From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: m68k, signals and single-stepping
Date: Thu, 30 Sep 2010 10:25:46 +0200
Message-ID: <m31v8b63jp.fsf@hase.home>
References: <20100930055823.GK19804@ZenIV.linux.org.uk>
	<AANLkTimigeCBQdh1CxsxojKNGXWcoLQg10weE8w1r5v5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:57384 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754294Ab0I3IZs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 30 Sep 2010 04:25:48 -0400
In-Reply-To: <AANLkTimigeCBQdh1CxsxojKNGXWcoLQg10weE8w1r5v5@mail.gmail.com>
	(Geert Uytterhoeven's message of "Thu, 30 Sep 2010 08:07:05 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Al,
>
> On Thu, Sep 30, 2010 at 07:58, Al Viro <viro@zeniv.linux.org.uk> wrot=
e:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0I've been trying to sort out what's going=
 on with TIF_DELAYED_TRACE,
>> but unfortunately neither User's Manual for 68040 nor Programmer's R=
eference
>> Manual for 68k family cover tracing exceptions in enough details ;-/

See 8.3 (Exception Priorities) in the MC68040UM, or 8.1.12 (Multiple
Exceptions) in the MC68030UM.

Andreas.

--=20
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint =3D 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4=
ED5
"And now for something completely different."
