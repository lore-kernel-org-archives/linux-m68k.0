Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D1A25D52A
	for <linux-m68k@lists.linux-m68k.org>; Tue, 20 May 2025 07:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747725701; cv=none; b=s52CBgsQ471gXIkXkIce1ARY6gpVi+YFl5PKhZ9jMRfwqo8A8BpSiyGk34ranvjcCDSJUiO3bZstBccJ6pWEyzqTHyidM3Moo2SLCp3qzgebr5ghl81HJucs371y1cugU8oQpknp9d5QvLRppn8KO7Of9C7wRJwIAv/YYaYrr4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747725701; c=relaxed/simple;
	bh=EicbBjvBOl2PIAvcrFVGoALjS8v7qICxDpr/x4X2WsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gM4Zk/bbz+vJiD0qfF6011ixiFkqpCd6Lw+aW4XXBIWK5oaxA9fCbybpO0n1fINPGEGPV7+ag6RvHe1JaAVHDn2+BaNyB+XZXzHYOemIznVTIRr15i35otEKTFiA+5a5hJm3zZg4BEWV+gFKfAG2LtPCp8OyUAYUnxjtTBMxw5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLZScHyD; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLZScHyD"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE35849E46;
	Tue, 20 May 2025 07:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E45C4CEE9;
	Tue, 20 May 2025 07:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747725699;
	bh=EicbBjvBOl2PIAvcrFVGoALjS8v7qICxDpr/x4X2WsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mLZScHyD6IAQocUyL5rQds44XBEDCD0AkH/pIKGwacAiAyj2zqSSo1LDAnx1Rxr/h
	 KZgzRNweczR1Sf6k9Qzy7Lh6wt/rkwVfxqunjU1bxvfUNnhrGSpV4I30oTst37JUXZ
	 COYS2qzUwHOeD2fDavIEhss6xrqps7yV9Xvf/0x/JEptGxApcEfuVMOL2SFQJ6Hy5O
	 DCcV7UxmWm1u3hFVIU+YgNmjjmEuH2rqA+HNtUhjbT3wbo8nDTqGhmZe5C00wQ3my1
	 L5HapCRwP5YZuipAM36z1sOirqOGOA/2aqiWp2L7Ms02O8DTiXOAEp3YJto85FNc0t
	 J4EeUnQB1RBQQ==
Date: Tue, 20 May 2025 08:21:33 +0100
From: Simon Horman <horms@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vladimir Oltean <olteanv@gmail.com>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	David Miller <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	Linux USB Mailing List <linux-usb@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next 2/3] net: phy: fixed_phy: remove irq argument
 from fixed_phy_register
Message-ID: <20250520072133.GO365796@horms.kernel.org>
References: <4d4c468e-300d-42c7-92a1-eabbdb6be748@gmail.com>
 <31cdb232-a5e9-4997-a285-cb9a7d208124@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31cdb232-a5e9-4997-a285-cb9a7d208124@gmail.com>

On Sat, May 17, 2025 at 10:35:56PM +0200, Heiner Kallweit wrote:
> All callers pass PHY_POLL, therefore remove irq argument from
> fixed_phy_register().
> 
> Note: I keep the irq argument in fixed_phy_add_gpiod() for now,
> for the case that somebody may want to use a GPIO interrupt in
> the future, by e.g. adding a call to fwnode_irq_get() to
> fixed_phy_get_gpiod().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>

