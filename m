From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [RFT PATCH] amiga, atari floppy: Use one request queue per disk
Date: Mon, 22 Nov 2010 20:10:25 +1300
Message-ID: <AANLkTi=6szFuBPcasJt742xOAKpXEbGS2J=H1qOjBzBP@mail.gmail.com>
References: <1285271646-2768-1-git-send-email-vgoyal@redhat.com>
	<20100923223530.GA5658@redhat.com>
	<AANLkTiki5-2x2PDrsbEHYQGPDUix4ChyXiSpzt0YFy56@mail.gmail.com>
	<20100925114300.GB20016@redhat.com>
	<AANLkTimOGz5L-SMRJ7J_oo4+Sdnp4wdeVzSi10qChNZ4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:64980 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750772Ab0KVHKc (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 22 Nov 2010 02:10:32 -0500
Received: by wyb28 with SMTP id 28so6672017wyb.19
        for <linux-m68k@vger.kernel.org>; Sun, 21 Nov 2010 23:10:31 -0800 (PST)
In-Reply-To: <AANLkTimOGz5L-SMRJ7J_oo4+Sdnp4wdeVzSi10qChNZ4@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Vivek Goyal <vgoyal@redhat.com>
Cc: linux-m68k@vger.kernel.org

Hi,

On Mon, Nov 22, 2010 at 9:18 AM, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
>
> end_request: I/O error, dev fd0, sector 6400
> Buffer I/O error on device fd0, logical block 800
> end_request: I/O error, dev fd0, sector 6400
> Buffer I/O error on device fd0, logical block 800
>
> Is that the correct sector number for trying to mount a FAT disk?

Answering myself - of course not; the number of clusters should not
exceed 2800.

Further testing demonstrates that the floppy driver works as long as I
specify the disk format to use with the mount command (i.e. mount
/dev/fd0h1440 /floppy). Bizarre.

I'll try to reproduce that and maybe track the problem down.

Cheers,

  Michael
