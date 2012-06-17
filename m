From: jdow <jdow@earthlink.net>
Subject: Re: Partitions: Amiga RDB partition on 2 TB disk way too big, while
 OK in AmigaOS 4.1
Date: Sun, 17 Jun 2012 15:27:55 -0700
Message-ID: <4FDE59EB.8050305@earthlink.net>
References: <201206170841.20222.Martin@lichtvoll.de> <201206171458.58462.Martin@lichtvoll.de> <CAMuHMdWY7=2nJDUjQFGPhdOAFGYeUsnvgPcaEvB2Gxf7P=E+Ug@mail.gmail.com> (sfid-20120617_225443_752860_DC66624F) <201206172306.03202.Martin@lichtvoll.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from elasmtp-banded.atl.sa.earthlink.net ([209.86.89.70]:36147 "EHLO
	elasmtp-banded.atl.sa.earthlink.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753259Ab2FQW15 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sun, 17 Jun 2012 18:27:57 -0400
In-Reply-To: <201206172306.03202.Martin@lichtvoll.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Martin Steigerwald <Martin@lichtvoll.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-m68k@vger.kernel.org

On 2012/06/17 14:06, Martin Steigerwald wrote:
...

I have a usage note for you and the person who did that partitioning.
If you start the partition at block 1 instead of block zero it probably
can coexist nicely with normal fdisk partitioning as well. (It used to
be able to since x86 partition tables didn't bother with blocks on the
first "cylinder" other than block zero.) I designed RDPrepX and
HDWrench to take advantage of that. (And I used it myself. Erm I used a
LOT of abominations such as safely nested partitions.)

{^_^}
