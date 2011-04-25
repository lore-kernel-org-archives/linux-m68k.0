From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Debian kernel v2.6.38
Date: Mon, 25 Apr 2011 14:36:56 +1200
Message-ID: <4DB4DE48.7040801@gmail.com>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com> <Pine.BSM.4.64L.1104231809290.3979@herc.mirbsd.org> <BANLkTimNekxddcHFFV1cAAyiCWsz2EY11g@mail.gmail.com> <4DB34EE6.6010004@gmail.com> <BANLkTinPijbiOCN_uTokGwT79ua0YyhOEw@mail.gmail.com> <Pine.BSM.4.64L.1104241134030.8787@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:46103 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758017Ab1DYChS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Apr 2011 22:37:18 -0400
Received: by pvg12 with SMTP id 12so1020331pvg.19
        for <linux-m68k@vger.kernel.org>; Sun, 24 Apr 2011 19:37:18 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1104241134030.8787@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

Hi Thorsten,
>>  - ataflop, atari_scsi, and atafb allocate ST-RAM only at driver
>> initialization,
>>    =20
>
> Speaking of atafb, with the trimmed-down patch I get garbled video
> with BootColorDepth 1, 4 or 8, and no option or video=3Datafb:vga2
> both; using video=3Datafb:vga4 (with BCD=3D4) has no output at all.
>  =20
Patch trimmed down in what respect? No ST-RAM pool allocation at all, o=
r=20
atafb trimmed down?
> This is no biggie for me, since the boxen work, but e.g. when
> there=E2=80=99s an =E2=80=9Cmounted n times=E2=80=9D fsck, the machin=
e takes ages longer
> to get up, and people will think it has frozen, so I=E2=80=99d very m=
uch
> like to get _some_ kind of fix into at least the second version
> of the Debian kernel, once we get past the initial hurdle=E2=80=A6
>  =20
Geert has given me something to think about with the allocate_resource=20
suggestion. If that works at module load time (both ataflop and=20
atari_scsi ought to work as modules) it definitely would be the=20
preferred way.

Cheers,

  Michael
