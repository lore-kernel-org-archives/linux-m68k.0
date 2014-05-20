From: Paul Bolle <pebolle@tiscali.nl>
Subject: m68knommu: CONFIG_I2C_COLDFIRE and CONFIG_RTC_DRV_M5441x
Date: Tue, 20 May 2014 21:28:41 +0200
Message-ID: <1400614121.4912.58.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org

Hi Geert,

In v3.6 both a check for CONFIG_I2C_COLDFIRE and two checks for
CONFIG_RTC_DRV_M5441x were added to the code for the coldfire platform
(in m525x.c and in m5441x.c respectively). Neither of these macros can
be matched to a Kconfig symbol.

Is a series that adds these Kconfig symbols pending?


Paul Bolle
