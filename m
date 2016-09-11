From: Christoph Hellwig <hch@infradead.org>
Subject: mvme147 status
Date: Sun, 11 Sep 2016 10:16:18 -0700
Message-ID: <20160911171618.GA13380@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org

Hi Geert,

do you know what the status of the mvme147 board support / SCSI driver
is?  The mvme147 scsi driver is one of the few remaining drivers still
using the scsi_module infrastructure thay I'd like to finally kill off.

Unlike some other drivers it should be fairly trivial to convert, but
I'd like to first know if there is any point in investing that work.
