From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 14/22] ncr5380: Add MAX_LUN limit
Date: Mon, 14 Mar 2016 00:51:12 -0700
Message-ID: <20160314075112.GA19372@infradead.org>
References: <20160314042700.596192247@telegraphics.com.au>
 <20160314042704.285983735@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-scsi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160314042704.285983735@telegraphics.com.au>
Sender: linux-scsi-owner@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, Ondrej Zary <linux@rainbow-software.org>, Sam Creasey <sammy@sammy.net>
List-Id: linux-m68k@vger.kernel.org

On Mon, Mar 14, 2016 at 03:27:14PM +1100, Finn Thain wrote:
> The driver has a limit of eight LUs because of the byte-sized bitfield
> that is used for busy flags. Reject commands with LUN > 7.

Please just set the max_lun parameter in the host template, which will
take care of this.

