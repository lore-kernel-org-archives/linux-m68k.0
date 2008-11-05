From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 2/2] Add SWIM floppy support for m68k Macs.
Date: Thu, 6 Nov 2008 10:43:47 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0811061037460.2469@loopy.telegraphics.com.au>
References: <12258061372635-git-send-email-laurent@lvivier.info>
 <12258061372626-git-send-email-laurent@lvivier.info>
 <Pine.LNX.4.64.0811052151480.25360@loopy.telegraphics.com.au>
 <65B5034D-7911-45D4-B013-75EA92922608@lvivier.info>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:46032 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752649AbYKEXnt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 5 Nov 2008 18:43:49 -0500
In-Reply-To: <65B5034D-7911-45D4-B013-75EA92922608@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <laurent@lvivier.info>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>



On Wed, 5 Nov 2008, Laurent Vivier wrote:

> > >+		break;
> > >+	default:
> > >+		swim_base = NULL;
> > >+		break;
> > >+	}
> > >+
> > >+	if (dev->id == 0 && base)
> > >+		swim_base = (struct swim *)base;
> > >+
> > >+	if (swim_base == NULL)
> > >+		return -ENODEV;
> >
> >I think dev->id is always 0?
> 
> Yes, but as platform driver allows to have several instance of platform device
> I though if we suppose we have several SWIM we should use the module parameter
> only with the first one.
> I can remove this if you think it is useless.

Dead code adds complexity and therefore requires more work (if only to 
figure out whether it is a bug or not). Compare with,

default:
	swim_base = (struct swim *)base;
	break;
}

if (swim_base == NULL)
	return -ENODEV;

Finn

> 
> Thank you for your comments.
> 
> Regards,
> Laurent
> ----------------------- Laurent Vivier ----------------------
> "The best way to predict the future is to invent it."
> - Alan Kay
> 
> 
> 
> 
> 
> 
