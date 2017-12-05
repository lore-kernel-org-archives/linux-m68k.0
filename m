From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 14/14] nubus: Add support for the driver model
Date: Tue, 5 Dec 2017 09:25:13 +0100
Message-ID: <20171205082513.GA24114@kroah.com>
References: <cover.1512454057.git.fthain@telegraphics.com.au>
 <5c71aa72f8c6192ca472b103555cad7441974f71.1512454057.git.fthain@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5c71aa72f8c6192ca472b103555cad7441974f71.1512454057.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Tue, Dec 05, 2017 at 01:20:02AM -0500, Finn Thain wrote:
> This patch brings basic support for the Linux Driver Model to the
> NuBus subsystem.
> 
> For flexibility, the matching of boards with drivers is left up to the
> drivers. This is also the approach taken by NetBSD. A board may have
> many functions, and drivers may have to consider many functional
> resources and board resources in order to match a device.
> 
> This implementation does not bind drivers to resources (nor does it bind
> many drivers to the same board). Apple's NuBus declaration ROM design
> is flexible enough to allow that, but I don't see a need to support it
> as we don't use the "slot zero" resources (in the main logic board ROM).
> 
> Eliminate the global nubus_boards linked list by rewriting the procfs
> board iterator around bus_for_each_dev(). Hence the nubus device refcount
> can be used to determine the lifespan of board objects.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Nice job:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
