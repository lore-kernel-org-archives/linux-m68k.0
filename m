From: Steven King <sfking@fdwdc.com>
Subject: Re: [PATCH 4/4] Implement gpio support for m54xx.
Date: Thu, 22 May 2014 06:46:57 -0700
Message-ID: <201405220646.58106.sfking@fdwdc.com>
References: <1400713233-9155-1-git-send-email-sfking@fdwdc.com> <1400713233-9155-5-git-send-email-sfking@fdwdc.com> <CAMuHMdVUNSJEGMFC2sM_=nqxt8_QXgaErX71cHA7VQGAXsQVeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp104.biz.mail.gq1.yahoo.com ([98.137.12.179]:41865 "HELO
	smtp104.biz.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751830AbaEVNq7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 22 May 2014 09:46:59 -0400
In-Reply-To: <CAMuHMdVUNSJEGMFC2sM_=nqxt8_QXgaErX71cHA7VQGAXsQVeA@mail.gmail.com>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: greg@uclinux.org, Linux/m68k <linux-m68k@vger.kernel.org>

On Wednesday 21 May 2014 11:39:07 pm Geert Uytterhoeven wrote:
> On Thu, May 22, 2014 at 1:00 AM,  <sfking@fdwdc.com> wrote:
> > +#define MCFGPIO_PODR           (MCF_MBAR + 0xA00)
> > +#define MCFGPIO_PDDR           (MCF_MBAR + 0xA10)
> > +#define MCFGPIO_PPDR           (MCF_MBAR + 0xA20)
> > +#define MCFGPIO_SETR           (MCF_MBAR + 0xA20)
> 
> The above two are identical. Is that intentional?

Yes.  Functionally, the PPDRs are read-only registers that when read, return the current state of the pins and the SETRs are write-only registers that for each pin configured as an output, if the corresponding bit in the write is a 1, the pin is driven high, and if the bit is 0, no effect.
