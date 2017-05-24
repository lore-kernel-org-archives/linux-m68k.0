From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [RFC] fix race in drivers/char/random.c:get_reg()
Date: Wed, 24 May 2017 17:42:28 -0400
Message-ID: <20170524214228.u5xysvdalferoxw5@thunk.org>
References: <1493538561-5075-1-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1493538561-5075-1-git-send-email-schmitzmic@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Sun, Apr 30, 2017 at 07:49:21PM +1200, Michael Schmitz wrote:
> get_reg() can be reentered on architectures with prioritized interrupts
> (m68k in this case), causing f->reg_index to be incremented after the
> range check. Out of bounds memory access past the pt_regs struct results.
> This will go mostly undetected unless access is beyond end of memory.
> 
> Prevent the race by disabling interrupts in get_reg().
> 
> Tested on m68k (Atari Falcon, and ARAnyM emulator).
> 
> Kudos to Geert Uytterhoeven for helping to trace this race.
> 
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Thanks, applied.  It will go to Linus shortly.

		     	     	- Ted
