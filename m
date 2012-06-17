From: jdow <jdow@earthlink.net>
Subject: Re: Partitions: Amiga RDB partition on 2 TB disk way too big, while
 OK in AmigaOS 4.1
Date: Sun, 17 Jun 2012 15:09:36 -0700
Message-ID: <4FDE55A0.50804@earthlink.net>
References: <201206170841.20222.Martin@lichtvoll.de> <4FDDB667.4020609@earthlink.net> <201206171458.58462.Martin@lichtvoll.de> <CAMuHMdWY7=2nJDUjQFGPhdOAFGYeUsnvgPcaEvB2Gxf7P=E+Ug@mail.gmail.com> <4FDE46E4.7020009@earthlink.net> <CAMuHMdVEq3RrQVJF9RgyC7UH-VAcWK=9FVvOs5Hf9X1gzv8UvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from elasmtp-banded.atl.sa.earthlink.net ([209.86.89.70]:53558 "EHLO
	elasmtp-banded.atl.sa.earthlink.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751943Ab2FQWJj (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sun, 17 Jun 2012 18:09:39 -0400
In-Reply-To: <CAMuHMdVEq3RrQVJF9RgyC7UH-VAcWK=9FVvOs5Hf9X1gzv8UvQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Martin Steigerwald <Martin@lichtvoll.de>, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-m68k@vger.kernel.org



On 2012/06/17 14:15, Geert Uytterhoeven wrote:
> Hi Joanne,
>
> On Sun, Jun 17, 2012 at 11:06 PM, jdow <jdow@earthlink.net> wrote:
>> I've asked Martin for a digital copy of his RDBs and what he thinks the
>> partition(s) should look like. I should also be told whether the disk
>> is supposed to be solely Amiga OSs or not. I gather it's not.
>
> His RDB is attached to https://bugzilla.kernel.org/show_bug.cgi?id=43521


I want the raw binary on the blocks 0 through the end of the RDBs or
128 blocks, which ever comes first. I don't see that there. I just
see the amiga-fdisk printout of it. With the actual binary I can
parse it myself and see what comes out.

(As a side note - RDBs work with large sector sizes. They pretty much
always have.)


...

>
> Gr{oetje,eeting}s,
>
>                          Geert

{^_^}
