From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v3 00/12] macintosh: Resolve various PMU driver problems
Date: Wed, 27 Jun 2018 13:27:37 +1000
Message-ID: <cacaecac00c1ac941a78da772bbcfb05142df87d.camel@kernel.crashing.org>
References: <cover.1528885172.git.fthain@telegraphics.com.au>
         <alpine.LNX.2.21.1806242119180.34@nippy.intranet>
         <874lhp6i4d.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <874lhp6i4d.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, Finn Thain <fthain@telegraphics.com.au>, geert@linux-m68k.org
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Wed, 2018-06-27 at 13:08 +1000, Michael Ellerman wrote:
> > I will rewrite patch 10/12 after Arnd's fixes and this series have all 
> > made their way through both powerpc and m68k trees, and submit it 
> > separately.
> 
> drivers/macintosh is supposedly maintained by Ben, but I'm not sure this
> series is high on his todo list.

We need at least to pull out a couple of powerbooks we have sitting in
drawers and try it out.

> 
> Should it just go in via the m68k tree?
> 
> Or I can create a topic branch to share it between ppc and m68k?
