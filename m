From: Finn Thain <fthain@telegraphics.com.au>
Subject: debian kernel config, was Re: [PATCH 1/1] m68k: add missing I/O
 macros {in,out}{w,l}_p() for !CONFIG_ISA
Date: Wed, 6 Oct 2010 01:10:56 +1100 (EST)
Message-ID: <alpine.OSX.2.00.1010060033590.289@localhost>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org>    <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org>    <alpine.OSX.2.00.1010041149030.285@localhost>    <Pine.BSM.4.64L.1010040738160.22274@herc.mirbsd.org>    <alpine.OSX.2.00.1010041943530.285@localhost>
    <Pine.BSM.4.64L.1010040906400.22591@herc.mirbsd.org>    <alpine.OSX.2.00.1010042115260.285@localhost>    <AANLkTi=TZBpWS1_ybct=fHeZ9N9AZE_+UoJnwM0HxanM@mail.gmail.com>    <Pine.BSM.4.64L.1010041338370.24518@herc.mirbsd.org>
 <3e567f8e50ae806e7dc2b734cc2785f9.squirrel@naiad.marenka.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:58480 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753450Ab0JEOKz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Oct 2010 10:10:55 -0400
In-Reply-To: <3e567f8e50ae806e7dc2b734cc2785f9.squirrel@naiad.marenka.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Stephen R. Marenka" <stephen@marenka.net>
Cc: linux-m68k@vger.kernel.org


On Tue, 5 Oct 2010, Stephen R. Marenka wrote:

> On Mon, October 4, 2010 8:40 am, Thorsten Glaser wrote:
>
> > Geert Uytterhoeven dixit:
> >
> > > I don't think it makes sense to build staging drivers on Debian/m68k.
> >
> > Yes. Tell that to *them*, though.
> >
> > > So can't you default to CONFIG_STAGING=n?
> >
> > No *I* can't.
> 
> But I can.

I don't know whether this driver works or not, but the mac config should 
probably add:

CONFIG_BLK_DEV_SWIM=m

And while we are on the subject of configs... ;-)

# CONFIG_CAN is not set
# CONFIG_WIRELESS is not set
# CONFIG_WIMAX is not set
# CONFIG_RFKILL is not set
# CONFIG_C2PORT is not set
# CONFIG_EEPROM_93CX6 is not set
# CONFIG_IDE_GD_ATAPI is not set
# CONFIG_SCSI_FC_ATTRS is not set
# CONFIG_SCSI_SAS_LIBSAS is not set
# CONFIG_LIBFC is not set
# CONFIG_MII is not set
# CONFIG_ETHOC is not set
# CONFIG_DNET is not set
# CONFIG_KS8842 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_NETDEV_1000 is not set
# CONFIG_NETDEV_10000 is not set
# CONFIG_WLAN is not set
# CONFIG_IEEE802154_DRIVERS is not set
# CONFIG_INPUT_FF_MEMLESS is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_MOUSE_PS2 is not set
# CONFIG_TCG_TPM is not set
# CONFIG_SPI is not set
# CONFIG_PPS is not set
# CONFIG_HWMON is not set
# CONFIG_SSB is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_REGULATOR is not set
# CONFIG_MEDIA_SUPPORT is not set
# CONFIG_FIRMWARE_EDID is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
# CONFIG_DISPLAY_SUPPORT is not set
# CONFIG_HID_PID is not set
# CONFIG_USB_SUPPORT is not set
# CONFIG_MEMSTICK is not set
# CONFIG_NEW_LEDS is not set
# CONFIG_UIO is not set

The mac config for 2.6.32-23 has all of the above enabled, but I think 
none are applicable.

OTOH, it might be less work for the Debian kernel team if instead we only 
picked the low fruit from this list and then disable for all Debian/m68k 
kernels what is inappropriate for all Debian/m68k kernels...

Finn
