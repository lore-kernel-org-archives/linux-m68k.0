From: Andreas Bombe <aeb@debian.org>
Subject: Re: [RFT PATCH] amiga, atari floppy: Use one request queue per disk
Date: Fri, 24 Sep 2010 02:43:11 +0200
Message-ID: <20100924004310.GA4134@amos.infernal>
References: <1285271646-2768-1-git-send-email-vgoyal@redhat.com>
 <20100923223530.GA5658@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100923223530.GA5658@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Goyal <vgoyal@redhat.com>
Cc: linux-kernel@vger.kernel.org, axboe@kernel.dk, linux-m68k@vger.kernel.org, hch@lst.de
List-Id: linux-m68k@vger.kernel.org

On Thu, Sep 23, 2010 at 06:35:30PM -0400, Vivek Goyal wrote:
> On Thu, Sep 23, 2010 at 03:54:04PM -0400, Vivek Goyal wrote:
> > Would be great if somebody who has the hardware can lend a hand here to
> > see if these patches work.

Last time I looked at it (well over a year ago), amiflop was seriously
bitrotted from disuse. Just a warning, it may not work properly even
before applying these patches.


Andreas Bombe
