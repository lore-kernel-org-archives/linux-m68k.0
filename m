From: Brad Boyer <flar@allandria.com>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Wed, 5 Nov 2008 20:09:23 -0800
Message-ID: <20081106040923.GA17813@cynthia.pants.nu>
References: <6865D876-3805-41B4-A3AD-15E8659254F2@lvivier.info> <3E58F122-AA9F-11DD-9F63-00050249ADE1@kaffe.org> <20081104200600.GA32663@cynthia.pants.nu> <F4658C02-D1D5-44E5-BF17-671AE770CD71@gmail.com> <Pine.LNX.4.64.0811051852060.23823@loopy.telegraphics.com.au> <B0EA0FB1-9FEF-4159-ADAB-B5C2EA910352@gmail.com> <Pine.LNX.4.64.0811052352001.26662@loopy.telegraphics.com.au> <8E70C812-7878-494E-A2D8-66BB7402A74E@lvivier.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:51199 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1753008AbYKFEKg (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 5 Nov 2008 23:10:36 -0500
Content-Disposition: inline
In-Reply-To: <8E70C812-7878-494E-A2D8-66BB7402A74E@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <Laurent@lvivier.info>
Cc: Finn Thain <fthain@telegraphics.com.au>, Joshua Juran <jjuran@gmail.com>, Riccardo <riccardo@kaffe.org>, geert@linux-m68k.org, linux-m68k@vger.kernel.org

On Wed, Nov 05, 2008 at 03:32:13PM +0100, Laurent Vivier wrote:
> The SWIM chip can act like an IWM one and there is a procedure to know  
> in which mode it is.

That is good to know. Hopefully that can also be used to detect which
chip it is, possibly by checking for a mode change failure.

> If we suppose the SWIM chip on MacII is at the same address than the  
> IWM one, we should be able to use this procedure to know if it is an  
> IWM or a SWIM.

It would have to be the same address, since the address decoding logic
is part of the bus interface circuits on 68k macs. Each IO chip just
has a chip select and a few address lines based on what I've seen.

	Brad Boyer
	flar@allandria.com

