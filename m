From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH v2 13/13] nubus: Add support for the driver model
Date: Sat, 25 Nov 2017 12:03:12 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1711251144190.3@nippy.intranet>
References: <cover.1510960933.git.fthain@telegraphics.com.au> <7f84ae0e2d6195ce0a4af1963d5ac15ff02a4749.1510960933.git.fthain@telegraphics.com.au> <20171118102123.GC8368@kroah.com> <alpine.LNX.2.00.1711190910550.3@nippy.intranet> <alpine.LNX.2.00.1711211046150.3@nippy.intranet>
 <20171123080449.GB490@kroah.com> <alpine.LNX.2.00.1711241040150.3@nippy.intranet> <20171124082428.GA21608@kroah.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171124082428.GA21608@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Fri, 24 Nov 2017, Greg Kroah-Hartman wrote:

> > > 
> > > But what happens when the bus code is unloaded if it is built as a 
> > > module?  The devices will be removed then.  Or they should be.
> > > 
> > 
> > This bus driver is not a module.
> 
> It can not be built as a module ever?
> 

That's right:

$ cat arch/m68k/Kconfig.bus
...
config NUBUS
        bool
        depends on MAC
        default y

I don't plan to convert this bus driver to a module, but this patch series 
would make that conversion more difficult, should it happen in future.

Therefore I plan to revise this submission to avoid or remove the existing 
global nubus_boards list, because the use of this list means that a 
hypothetical device_put() call is not allowable.

You may wish to disregard this submission.

Thanks.

-- 
