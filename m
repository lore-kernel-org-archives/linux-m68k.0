From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [uClinux-dev] [PATCH 00/12] m68knommu: generalize the ColdFire
 clock support for all CPU types
Date: Mon, 26 Nov 2012 16:34:31 +0100
Message-ID: <20121126163431.62231f3b@skate>
References: <1353041256-2959-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([88.190.12.23]:51000 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755356Ab2KZPew (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 26 Nov 2012 10:34:52 -0500
In-Reply-To: <1353041256-2959-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uClinux development list <uclinux-dev@uclinux.org>
Cc: gerg@snapgear.com, linux-m68k@vger.kernel.org

Hello,

On Fri, 16 Nov 2012 14:47:24 +1000, gerg@snapgear.com wrote:

> The current Coldfire clock code only really supports those ColdFire
> CPU types that have the more advanced enable/disable clock hardware
> support. If we generalize our clock code we can support all types,
> even those with simpler fixed clock trees.
> 
> This results in much cleaner and consistent clock support. And it
> means that we can in the future use the clock API in our timers and
> throughout the other ColdFire p[eripheraps, instead of hard coded
> clock definitions.

Have you considered instead using the generic clock framework that is
now in drivers/clk/ ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
