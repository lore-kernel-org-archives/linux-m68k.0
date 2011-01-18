From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: build warnings
Date: Tue, 18 Jan 2011 14:18:15 +1300
Message-ID: <AANLkTimWyj2HriMd3mpPgc1Mu9RWb8fyPiKrVWfs=4+t@mail.gmail.com>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
	<alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>
	<AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com>
	<AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com>
	<Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org>
	<AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com>
	<Pine.BSM.4.64L.1101162226120.11797@herc.mirbsd.org>
	<AANLkTi=QH7=6ddP=KoTywDpYrwnB21XGnmwhmFkZganD@mail.gmail.com>
	<AANLkTimnXi0g_F4TT7gv3JnebwBcJe2oH7NNo83JN2XZ@mail.gmail.com>
	<AANLkTi=O2C5keqTm3Q4w8_T1Z=Dd68CAPSe-FaWt_h_x@mail.gmail.com>
	<AANLkTinqCexLUjNxgSmkphx-oMVgz27b2GH1n2NVNU2n@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:45064 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751092Ab1ARBSR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 17 Jan 2011 20:18:17 -0500
Received: by wwa36 with SMTP id 36so5937587wwa.1
        for <linux-m68k@vger.kernel.org>; Mon, 17 Jan 2011 17:18:16 -0800 (PST)
In-Reply-To: <AANLkTinqCexLUjNxgSmkphx-oMVgz27b2GH1n2NVNU2n@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

Geert,

On Tue, Jan 18, 2011 at 9:14 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Jan 17, 2011 at 20:50, Michael Schmitz
> <schmitzmic@googlemail.com> wrote:
>> The only patch that has been missed, but may be relevant for Atari s=
till:
>>
>> 16 bit FAT default for GEMDOS:
>>
>> --- linux-m68k-git/linux-m68k/fs/fat/inode.c =A0 =A02010-11-10
>> 19:40:40.131506952 +1300
>> +++ linux-2.6-2.6.37/debian/build/source_m68k_none/fs/fat/inode.c
>> =A02011-01-17 20:18:44.484006839 +1300
>> @@ -923,10 +923,10 @@
>> =A0 =A0 =A0 =A0{Opt_err_cont, "errors=3Dcontinue"},
>> =A0 =A0 =A0 =A0{Opt_err_panic, "errors=3Dpanic"},
>> =A0 =A0 =A0 =A0{Opt_err_ro, "errors=3Dremount-ro"},
>> + =A0 =A0 =A0 {Opt_discard, "discard"},
>> =A0 =A0 =A0 =A0{Opt_atari_yes, "atari=3Dyes"},
>> =A0 =A0 =A0 =A0{Opt_atari_yes, "atari"},
>> =A0 =A0 =A0 =A0{Opt_atari_no, "atari=3Dno"},
>> - =A0 =A0 =A0 {Opt_discard, "discard"},
>> =A0 =A0 =A0 =A0{Opt_obsolate, "conv=3Dbinary"},
>> =A0 =A0 =A0 =A0{Opt_obsolate, "conv=3Dtext"},
>> =A0 =A0 =A0 =A0{Opt_obsolate, "conv=3Dauto"},
>
> The order of the options shouldn't matter. Due to historical reasons,
> it's different
> on master and m68k-queue.

I thought the 'discard' marks the start of no longer used options
(i.e. option processing stops at discard). My bad.

>
>> I'd suggest I first test that this option is still required - will
>> have to sacrifice a spare SCSI disk for that.
>
> I think there was a half consensus or so that we still need it, but
> not enough to
> put some weight behind it ;-)

Given that I could not even remember what it was that I had to do to
the FAT code to get it to what it does now, we best leave it at that.
Schroedingers cat, and all that :-)

Cheers,

  Michael
