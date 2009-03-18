From: Rob Landley <rob@landley.net>
Subject: Re: make headers_install broken for ARCH=m68k in 2.6.29-rc7.
Date: Tue, 17 Mar 2009 23:03:58 -0500
Message-ID: <200903172304.00157.rob@landley.net>
References: <200903120437.03837.rob@landley.net> <200903161521.00036.rob@landley.net> <49BEDC75.1080704@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <49BEDC75.1080704@snapgear.com>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, dwmw2@infradead.org, linux-next@vger.kernel.org, linux-m68k@lists.linux-m68k.org

On Monday 16 March 2009 18:10:45 Greg Ungerer wrote:
> >>    git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git
> >> fix-includes
...
> Did you get the "fix-includes" branch?

Quite possibly not.  (I'm not a git person.)

I did a "git clone git://blah fix-includes" of the branch you gave a URL to, 
checked for tags and saw nothing particularly interesting, did a log -v and 
exported an archive of the most recent commit, and built it.

(Just tried it again with the same result.)

What _should_ I have done?

Rob
