From: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [RFT PATCH] amiga, atari floppy: Use one request queue per disk
Date: Thu, 23 Sep 2010 18:35:30 -0400
Message-ID: <20100923223530.GA5658@redhat.com>
References: <1285271646-2768-1-git-send-email-vgoyal@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1285271646-2768-1-git-send-email-vgoyal@redhat.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org, axboe@kernel.dk, linux-m68k@vger.kernel.org
Cc: hch@lst.de

On Thu, Sep 23, 2010 at 03:54:04PM -0400, Vivek Goyal wrote:
> 
> Hi,
> 
> We seem to have deprecated the notion of sharing request queue across gendisks. Now we need to instanciate one request queue per disk.
> 
> There see to be still some drivers sharing request queue across disks. Arch
> specific floppy drivers like amiga and atari are doing so.
> 
> These are two patches which should fix the issue. But these patches are
> completely untested. Not even compilte tested. Don't have hardware to test
> them. 
> 
> Would be great if somebody who has the hardware can lend a hand here to
> see if these patches work.

Sending this mail to linux-m68k@lists.linux-m68k.org list, incase somebody
can help there with testing.

Vivek
