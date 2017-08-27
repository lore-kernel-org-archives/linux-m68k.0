From: Steven King <sfking@fdwdc.com>
Subject: Re: [PATCH] m68knommu: remove dead code
Date: Sun, 27 Aug 2017 12:36:31 -0700
Message-ID: <201708271236.31222.sfking@fdwdc.com>
References: <20170824143407.21273-1-alexandre.belloni@free-electrons.com> <363abb76-2001-f072-fd8e-332014ee07e0@sysam.it> <20170827190959.ueii2yihdzbi263s@piout.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp103.biz.mail.gq1.yahoo.com ([98.137.12.178]:35412 "EHLO
        smtp103.biz.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751294AbdH0T6Z (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 27 Aug 2017 15:58:25 -0400
In-Reply-To: <20170827190959.ueii2yihdzbi263s@piout.net>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Angelo Dureghello <angelo@sysam.it>, Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Sunday 27 August 2017 12:09:59 pm Alexandre Belloni wrote:
> On 27/08/2017 at 13:22:09 +0200, Angelo Dureghello wrote:
> > Hi,
> >
> > just to inform you that i have in mind to add spi(soon, at least seems
> > just a matter con Kconfig changes) and usdhc(later)
> > drivers/support for stmark2 mcf5441x based board.
> > But no problem, in case i'll re-add the this code as needed.
>
> I think it is easy enough to reintroduce init_BSP with your patch. It is
> unfortunate that this useless function stayed that way so long, waiting
> for a real user :)

I believe I was the original author, I dont remember why the code wasn't 
merged.  I still have the branch, if some wants to take it over and see it 
gets merged I wouldn't have any objections ;-)
