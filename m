From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH] m68k atari: reserve some ST-RAM early on for device
 buffer use (was: Re: Aranym, more than 244MB FastRAM, garbled display)
Date: Sun, 24 Oct 2010 17:11:57 +1300
Message-ID: <AANLkTi=YEmB5hKiDYcLie8OnkySyEoQLC_qiXoVzTT8w@mail.gmail.com>
References: <alpine.LNX.2.00.1010011728270.4788@halbrend.uninett.no>
	<m2tyl5u9hu.fsf@igel.home>
	<alpine.LNX.2.00.1010011908550.4788@halbrend.uninett.no>
	<Pine.BSM.4.64L.1010041947160.3776@herc.mirbsd.org>
	<AANLkTinq7CXPpYVfAYhgH9ea1FQs_f+AhYsU1-+ZdUx+@mail.gmail.com>
	<Pine.BSM.4.64L.1010060910520.21623@herc.mirbsd.org>
	<AANLkTi=ZrDoFPxFNZ3OKurvcrBuN3fS0gTvAeYpLQqCi@mail.gmail.com>
	<AANLkTin+_c=Luvns2MYkVhBksB8vD3reDh8W6a8Bje2o@mail.gmail.com>
	<AANLkTikumgbPW12gcsUML-JqyCUUaws2=r1gY7NT4fgJ@mail.gmail.com>
	<4CC14067.8090903@gmail.com>
	<m3hbged2d2.fsf@hase.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:47796 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751115Ab0JXEL6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Oct 2010 00:11:58 -0400
Received: by wwe15 with SMTP id 15so2351290wwe.1
        for <linux-m68k@vger.kernel.org>; Sat, 23 Oct 2010 21:11:57 -0700 (PDT)
In-Reply-To: <m3hbged2d2.fsf@hase.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Fri, Oct 22, 2010 at 10:05 PM, Andreas Schwab <schwab@linux-m68k.org=
> wrote:
> Michael Schmitz <schmitzmic@googlemail.com> writes:
>
>> +static int __init atari_stram_setup(char *arg)
>> +{
>> + =A0 =A0 =A0 =A0int rc=3D0;
>> +
>> + =A0 =A0 =A0 =A0if (!MACH_IS_ATARI)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>> +
>> + =A0 =A0 =A0 =A0if (!(rc =3D sscanf(arg, "%d", &pool_size))) {
>
> =A0 =A0 =A0 =A0 =A0 pool_size =3D memparse(arg, NULL);

Thanks, that's a lot more elegant.

  Michael
