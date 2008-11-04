From: Riccardo <riccardo@kaffe.org>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Tue, 4 Nov 2008 19:34:41 +0100
Message-ID: <3E58F122-AA9F-11DD-9F63-00050249ADE1@kaffe.org>
References: <6865D876-3805-41B4-A3AD-15E8659254F2@lvivier.info>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cp-out11.libero.it ([212.52.84.111]:36589 "EHLO
	cp-out11.libero.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756107AbYKDSfE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 4 Nov 2008 13:35:04 -0500
In-Reply-To: <6865D876-3805-41B4-A3AD-15E8659254F2@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <Laurent@lvivier.info>
Cc: Brad Boyer <flar@allandria.com>, geert@linux-m68k.org, linux-m68k@vger.kernel.org

Hi,

On Sunday, November 2, 2008, at 01:02  PM, Laurent Vivier wrote:

>> work on a Mac II. They didn't originally ship with a SWIM chip at
>> all, but that was available as an upgrade. From the factory they
>> came with the old IWM chip. It's not clear to me if the driver uses
>> any of the SWIM features other than the capability to detect and
>> read high density media which the old drives obviously don't do.
>
>
> I don't have MacII to test. But this driver needs a SWIM chip to work.

I have a mac II, but I upgraded the SWIM chip, IIRC. I think I upgraded 
only one of the two drives to high density, but that shouldn't affect 
you I suppose, since the problem would be the chip. I'll look in my 
spare parts bin.

Riccardo

