From: Rob Landley <rob@landley.net>
Subject: Re: make headers_install broken for ARCH=m68k in 2.6.29-rc7.
Date: Wed, 18 Mar 2009 13:12:00 -0500
Message-ID: <200903181312.02047.rob__10275.8807050579$1237400039$gmane$org@landley.net>
References: <200903120437.03837.rob@landley.net> <200903172304.00157.rob@landley.net> <49C087F3.3080507@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <49C087F3.3080507@snapgear.com>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, dwmw2@infradead.org, linux-next@vger.kernel.org, linux-m68k@lists.linux-m68k.org

On Wednesday 18 March 2009 00:34:43 Greg Ungerer wrote:
> Hi Rob,
>
> Rob Landley wrote:
> > On Monday 16 March 2009 18:10:45 Greg Ungerer wrote:
> >>>>    git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git
> >>>> fix-includes
...
> > What _should_ I have done?
>
> The git clone you have done will just get the master branch,
> and put it in a directory named fix-includes.
>
> Which is ok, but you still won't have the "fix-includes" branch.
> Do this after the clone:
>
>    git pull
> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git
> fix-includes

Ah, that did something interesting...  And the resulting headers built in 
uClibc.  (Works for me!)

confirmed-uClibc-builds-with-it-by: Rob Landley <rob@landley.net>

Thanks,

Rob
