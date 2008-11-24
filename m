From: Kars de Jong <jongk@linux-m68k.org>
Subject: Conversion of old Amiga NCR53C9x drivers to esp_scsi
Date: Mon, 24 Nov 2008 22:01:50 +0100
Message-ID: <1227560510.15190.18.camel@kars.perseus.home>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-scsi-owner@vger.kernel.org>
Sender: linux-scsi-owner@vger.kernel.org
To: Linux/m68k kernel mailing list <linux-m68k@vger.kernel.org>
Cc: linux-scsi <linux-scsi@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Hello everyone,


After an initial failure in February this year I have now gotten my
Blizzard SCSI Kit IV to work with the esp_scsi core.

It turns out the DMA engine doesn't like a transfer size of only 2 bytes
(at least not when receiving). The bytes were in the FSC FIFO, but
didn't get transferred to DRAM and the final interrupt didn't occur so
the driver got stuck.

The old driver used to do such small transfers using PIO, so that is
what I do now in the glue driver.

What is the way to go? Revive the glue named drivers/scsi/blz1230.c?
Or should it be renamed?

Some of the other drivers may be a little more problematic because they
had more driver operations which are not present in the esp_scsi DMA
abstraction.


Kind regards,

Kars.


