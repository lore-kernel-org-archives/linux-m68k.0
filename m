From: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v3 57/77] ncr5380: Use standard list data structure
Date: Tue, 22 Dec 2015 08:55:21 +0100
Message-ID: <567901E9.70006@suse.de>
References: <20151222011737.980475848@telegraphics.com.au>
 <20151222011753.525503258@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43991 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751166AbbLVHzY (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 22 Dec 2015 02:55:24 -0500
In-Reply-To: <20151222011753.525503258@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, "James E.J. Bottomley" <JBottomley@odin.com>, Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org

On 12/22/2015 02:18 AM, Finn Thain wrote:
> The NCR5380 drivers have a home-spun linked list implementation for
> scsi_cmnd structs that uses cmd->host_scribble as a 'next' pointer. A=
dopt
> the standard list_head data structure and list operations instead. Re=
move
> the eh_abort_handler rather than convert it. Doing the conversion wou=
ld
> only be churn because the existing EH handlers don't work and get rep=
laced
> in a subsequent patch.
>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>
> ---
>
> Changed since v2:
> - Fix NULL pointer dereference in NCR5380_reselect() when SUPPORT_TAG=
S is
>    enabled in the atari_NCR5380.c core driver.
>
Well, using ->host_scribble allows for an easy check on the midlayer if=
=20
a command has been properly released by the LLDD. But that's just a=20
side-note.

Reviewed-by: Hannes Reinecke <hare@suse.com>

Cheers,

Hannes
--=20
Dr. Hannes Reinecke		      zSeries & Storage
hare@suse.de			      +49 911 74053 688
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: J. Hawn, J. Guild, F. Imend=F6rffer, HRB 16746 (AG N=FCrnberg)
