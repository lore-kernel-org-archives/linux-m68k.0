Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277ED42FCC4
	for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Jul 2026 21:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784583829; cv=none; b=m/7kWHtoXpfbAgsNBeyVKyRUi09i4dLMls9u/zDX+O2fiBMG4O5L6KDJo6+Cfkc/pKhHDSKQLBBshRNLt2U8WY5wX+F0GEhgqWEaf7HTS4NhXyn80S0XXkxJrm9Gd1Cfd+ipEjC8RIO5SQvKoWXc6nzn+H0yIBBbTQvd0+x78X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784583829; c=relaxed/simple;
	bh=Aj/WK0wneOpE2vP8H7iwjacRk0G6xA0Om/pREqe4ebY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QYM7dyZ52Gm683WUlWmChyEM6Znp2W+EsAEqOJ+t2GdQG5djZUlOB6W0RIJYLp3NT6BVPDbsbg3pJz4X6TFFS61LGJkma8AoeUBtEm72i3KqCgPPVkyxvFyKD7J+y8/iunnijGmdA5urUoYrJdqWcLXazLEF5jJ/WMnP2AC9S4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E981439F5;
	Mon, 20 Jul 2026 21:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D77D1F000E9;
	Mon, 20 Jul 2026 21:43:47 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id E0D76180D65; Mon, 20 Jul 2026 23:43:45 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Sebastian Reichel <sre@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
In-Reply-To: <20260617-coldfire-rcm-power-on-reason-v3-0-1a7c7b6b14e7@yoseli.org>
References: <20260617-coldfire-rcm-power-on-reason-v3-0-1a7c7b6b14e7@yoseli.org>
Subject: Re: (subset) [PATCH v3 0/2] Coldfire m5441x: add RCM power-on
 reason driver
Message-Id: <178458382591.311390.7037869995875502817.b4-ty@collabora.com>
Date: Mon, 20 Jul 2026 23:43:45 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 17 Jun 2026 21:17:14 +0200, Jean-Michel Hautbois wrote:
> This series adds a power_on_reason driver for the Freescale ColdFire
> MCF5441x Reset Controller Module.
> 
> The MCF5441x has six documented sources of reset (power-on, external
> pin, software, PLL loss-of-clock, PLL loss-of-lock and core watchdog
> timeout). They are latched in the Reset Status Register (RSR) at
> 0xec090001. The new driver decodes that register once at probe time
> and exposes the result through the power_on_reason sysfs ABI.
> 
> [...]

Applied, thanks!

[1/2] power: reset: add MCF5441x RCM power-on reason driver
      commit: f0ec0d960c99837dc61e1604c3ec83e53c8c829f

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>

