Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD01E25D1F5
	for <linux-m68k@lists.linux-m68k.org>; Tue, 20 May 2025 07:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747725670; cv=none; b=UQ4ojzMMi2CtvoO6BkxrfBvBpwF+Q5EmjDLrGEiVzNI6FdXzzlqhkecY61LUBjYE1oAfxTFjmYGwZgqUnVP8/El8hVEKN7j5PhiMVG56OhhHu9mtk8nsDvQMjt6h9/CLvX3izOcLAksO3/KGpLLnUjGALnQuweCKVKZn3eY4RxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747725670; c=relaxed/simple;
	bh=FkDkx7Zk6sZrjYecQY2QA2nA21SGJACJz6TucAvvDtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rldz9lnBM7DJovbMrlU2W6g+1eUtREpslKtBd5xjAlO1OxQmSGDWX0pcPpuUbjjAhFEASaag9ohVsO7IxJstpA6wZ+v10hZkzSOLwSU+bVGrcRyHHlbaYECVIZ9XBFM0Qqnm8E/HiXXQBpIT6AQqI6xVQkkxxkajAAyWb5VN18I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q+HvWkJx; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q+HvWkJx"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C8158A4DEAC;
	Tue, 20 May 2025 07:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C15BC4CEE9;
	Tue, 20 May 2025 07:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747725667;
	bh=FkDkx7Zk6sZrjYecQY2QA2nA21SGJACJz6TucAvvDtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q+HvWkJxhVdSnD61usP3J1/+YBByK32V8udOT+jf4y7MDyq/f9NQkC/IE3is+L3CW
	 5oUqUrjoaY5CoEF132SJwzxYgP3EdctV8/S6y+ngKa2MVcHTHJw4QCDGFJ0Dij1rEo
	 NmRj/OvnTeu8m9oAKiXmd83nq/Kvpx8kXqpVsaqU7oKpMErgTuzKltR/EhB+5Gi5Vf
	 BUBntA3UQvXHlP6EiquJwwCjkVCeWOb8B1lWoOrDk8GhiFO6G5ioXbvvhiQV+lYAjN
	 jpaMBrKf/WkVTsG6fYog5Aun3TlgA+giaCJsvKEgP+8Ti0H0zQSuytZOwvEo7WrFwr
	 P9TDjJw8rBmqw==
Date: Tue, 20 May 2025 08:21:01 +0100
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
Subject: Re: [PATCH net-next 1/3] net: phy: fixed_phy: remove irq argument
 from fixed_phy_add
Message-ID: <20250520072101.GN365796@horms.kernel.org>
References: <4d4c468e-300d-42c7-92a1-eabbdb6be748@gmail.com>
 <b3b9b3bc-c310-4a54-b376-c909c83575de@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3b9b3bc-c310-4a54-b376-c909c83575de@gmail.com>

On Sat, May 17, 2025 at 10:34:32PM +0200, Heiner Kallweit wrote:
> All callers pass PHY_POLL, therefore remove irq argument from
> fixed_phy_add().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>

