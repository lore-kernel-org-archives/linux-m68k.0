From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 3/8] net: ax88796: Do not free IRQ in ax_remove()
 (already freed in ax_close()).
Date: Tue, 17 Apr 2018 23:13:29 +0200
Message-ID: <20180417211329.GA18336@lunn.ch>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
 <1523930895-6973-4-git-send-email-schmitzmic@gmail.com>
 <dcbec8cb-8fc9-ffe6-a005-b04bbd30cd59@physik.fu-berlin.de>
 <CAOmrzk+uE_ouXCmmd78j0zG4QrqT=TvXNhMOQxtt5KWg8KS_cQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOmrzk+uE_ouXCmmd78j0zG4QrqT=TvXNhMOQxtt5KWg8KS_cQ@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, netdev@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <Michael.Karcher@fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

On Wed, Apr 18, 2018 at 08:32:25AM +1200, Michael Schmitz wrote:
> Hi Adrian,
> 
> On Tue, Apr 17, 2018 at 11:40 PM, John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
> > On 04/17/2018 04:08 AM, Michael Schmitz wrote:
> >>
> >> From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> >
> > This should be:
> >
> > From: Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>
> 
> I haven't found a way to change that in my tree yet, sorry. Unless
> someone has a simple way to fix patch authorship after a merge, I may
> have to reimport from scratch.

git commit --am --author=<author>

    Andrew
