From: Christoph Hellwig <hch@infradead.org>
Subject: Re: mvme147 status
Date: Mon, 12 Sep 2016 00:46:42 -0700
Message-ID: <20160912074642.GA21474@infradead.org>
References: <20160911171618.GA13380@infradead.org>
 <CACz-3rgtA0pvSZV38ezRWAxDsgcEa_+_teQ3-1dvY4Cf22hfyQ@mail.gmail.com>
 <CAMuHMdUFxc_OBR8L84gbgNW8u0aArQNxMGf5P4mPSj56xQXeNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUFxc_OBR8L84gbgNW8u0aArQNxMGf5P4mPSj56xQXeNQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kars de Jong <nacirrut@gmail.com>, Christoph Hellwig <hch@infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Stephen N Chivers <schivers@csc.com.au>

On Mon, Sep 12, 2016 at 09:43:48AM +0200, Geert Uytterhoeven wrote:
> The wd33c93 chipset driver is also used on various Amigas and on SGI MIPS
> systems. Those no longer use scsi_module, though (IIRC I converted most of
> them in 2009).
> 
> > still build?
> 
> Of course it does ;-)
> 
> > I personally don't have a big issue with just killing the board support
> > code, it can always be revived when needed.
> 
> Killing board support doesn't gain us that much...
> 
> Stephen, are you still using them?

I'll convert it then, shouldn't be too much work.  Let's hope the
buildbot covers m68k..
