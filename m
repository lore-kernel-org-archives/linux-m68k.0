Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CA54BCABA
	for <linux-m68k@lists.linux-m68k.org>; Wed,  1 Jul 2026 18:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782928817; cv=none; b=uLQ/E21vqumZ1q05FwcPSTxS9CJNKoKyq7/tgfU6BLCLzwAfLZWuwTkExbwDZqApxz39j8iJDLEDllOErMr4NtGTYpAAt8umXrwDSvWBUqdThyVhhNf4ztNXNXNoEkvt+H6FmVQDhKyAjvX+eZEOs1fp8H7xx1B3IfUpslLsyaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782928817; c=relaxed/simple;
	bh=IKVQLAIpJBqpULw36UA4BMH9WLN/5GXEfLx3U//uxu0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ad5Ip70XiNqJlZa5FwPN5rewB9YOw28aALCOmX1IJ5k0VBfjSqrcfvDfQ+YBOMxvh1WCaQ3zibu3Qg/rCKJ1rOPnPWXl9ZtW30gM2ts4WbBk7rFU9aHAptgTgmfy85nzT8XdQmVayG2PrWzP3dvLPc4vhqg9ZkpAeRTue7/VhEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPquNYnq; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPquNYnq"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD2A56001D;
	Wed,  1 Jul 2026 18:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF52D1F000E9;
	Wed,  1 Jul 2026 18:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782928815;
	bh=IKVQLAIpJBqpULw36UA4BMH9WLN/5GXEfLx3U//uxu0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DPquNYnqFVNYTSn3zrpf/OpIxbIMGloGzttGIlxPtmUty9+qU68cpnMwHuSOtdX5V
	 Lc710+E6btaik5PG3QKbgUrSigED5ZB+SX+3t/YugZikh1chuFY9sviEdveOybqcR5
	 JfZYj+o5CDf66Xr8YI6EswrVAksZN/ul9qukz488X0CTMaSnAQvl7aZvZq9fQQBxKh
	 4VxrPJ/MSaCqS/8PhgIF7et/OfwzwuwzHpgSUisRRK+NR2cRE/63PKZPRk90Wr4d5x
	 ZG9A+QjgW646Ur9Cc2XxGoe8vGGERn/LYzkosD9uGMzSUvJeXYau9QP/ffh79Gl7jl
	 s++P6qsJ2SiJw==
Date: Wed, 1 Jul 2026 19:00:09 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v7 0/2] add mcf54415 DAC driver
Message-ID: <20260701190009.04cff040@jic23-huawei>
In-Reply-To: <20260701-wip-stmark2-dac-v7-0-ff8fdcc8010a@baylibre.com>
References: <20260701-wip-stmark2-dac-v7-0-ff8fdcc8010a@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 01 Jul 2026 16:17:22 +0200
Angelo Dureghello <adureghello@baylibre.com> wrote:

> This patchset adds a minimalistic DAC driver for the NXP mcf54415/6/7/8
> builtin DACs.
Applied patch 1 to the testing branch of iio.git.

Thanks,

Jonathan
