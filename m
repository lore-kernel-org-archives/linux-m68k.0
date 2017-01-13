From: Jeff Epler <jepler@unpythonic.net>
Subject: Re: [PATCH v2 7/7] uapi: export all headers under uapi directories
Date: Thu, 12 Jan 2017 19:04:27 -0600
Message-ID: <20170113010427.GA22650__43180.8387315415$1484271052$gmane$org@unpythonic.net>
References: <bf83da6b-01ef-bf44-b3e1-ca6fc5636818@6wind.com>
 <1483695839-18660-1-git-send-email-nicolas.dichtel@6wind.com>
 <1483695839-18660-8-git-send-email-nicolas.dichtel@6wind.com>
 <20170109125638.GA15506@infradead.org>
 <464a1323-4450-e563-ff59-9e6d57b75959@6wind.com>
 <alpine.LSU.2.20.1701121727180.19188@erq.vanv.qr>
 <9d68af8a-a609-d7b1-58a9-f1155313b077@6wind.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9d68af8a-a609-d7b1-58a9-f1155313b077@6wind.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Cc: Jan Engelhardt <jengelh@inai.de>, Christoph Hellwig <hch@infradead.org>, arnd@arndb.de, mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, adi-buildroot-devel@lists.sourceforge.net, linux-c6x-dev@linux-c6x.org, linux-cris-kernel@axis.com, uclinux-h8-devel@lists.sourceforge.jp, linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-metag@vger.kernel.org, linux-mips@linux-mips.org, linux-am33-list@redhat.com, nios2-dev@lists.rocketboards.org, openrisc@lists.librecores.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel

On Thu, Jan 12, 2017 at 05:32:09PM +0100, Nicolas Dichtel wrote:
> What I was trying to say is that I export those directories like other are.
> Removing those files is not related to that series.

Perhaps the correct solution is to only copy files matching "*.h" to
reduce the risk of copying files incidentally created by kbuild but
which shouldn't be installed as uapi headers.

jeff
