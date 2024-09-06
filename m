Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00411CCB30
	for <linux-m68k@lists.linux-m68k.org>; Fri,  6 Sep 2024 11:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725623738; cv=none; b=gn4o7vcARcd/sW6YernIs9YU8soXRjK03Ptm/KgY5faffmZ7a8Tx+jFSYaJ7FLbjQG4VbRsQovPY2pggqF78aY2DwrtBEQf6gFiBOwfJ1msgXkMfuZ3jtfKlhAdz/3Jf9ufIHc9SERlu4PviWS3etSj4jqq3IFywjrZjNJdy8Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725623738; c=relaxed/simple;
	bh=QxE9RESXTw7Upog4YCOJxO1cUpVKX5Nr5z6/QmmSvFY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lk+PA+HHf2CGNoIBQ4XoCo+gozjf86Mm4hBWJZ3/oy3GOKlWnURNa64P6KbdTd26YWAzwReVdcgvjO0IVN09ymRgzvrVnsRQkl6euRpNQjOrXNwFZvv5oTEvf5DPo5uQPjp8lLcdWHuIT3WIX2u1paY41+LRfVBcRv15cPNc3dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=noRXCCC7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="noRXCCC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623735;
	bh=VFMQjyITsX575+mngCN1LQxxTs5zaxCvJY1k340CyPo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=noRXCCC73wYP1jQqw3g7gJIZ5PIKZCP8hZkHK15ro6irx0+zaLF7r7L5culUu0/k3
	 B+sCZjEAj5SkKioEN5pe+I5f+Kb0HpsILCp2SQEUx2FwXzO+PYFivR2zXa5ffba9QW
	 A/K7GMpRKkqU7IWPpadcaIsgVJWs9oLhDB9YCI0X8Ya4A3p5WOlehJ/Iq2imbLAG+M
	 Fv3wWfXBRHfrjly5NwG5JCnHnLuFHwkBpHts/koPycTgokacV49jif1slYtAYYGLQy
	 vqC/2tUu5qIa5TjspZtam7Aal6X67oFRin9xxBnV/JA7ICoyFE/Uhh5rf8KNBTSurN
	 5daAJm7wTsaiA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZRq0cw4z4x8f;
	Fri,  6 Sep 2024 21:55:35 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org
In-Reply-To: <20240821082101.877438-1-mpe@ellerman.id.au>
References: <20240821082101.877438-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] macintosh/via-pmu: register_pmu_pm_ops() can be __init
Message-Id: <172562357221.467568.5690027128630498625.b4-ty@ellerman.id.au>
Date: Fri, 06 Sep 2024 21:52:52 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wed, 21 Aug 2024 18:21:01 +1000, Michael Ellerman wrote:
> register_pmu_pm_ops() is only called at init time, via
> device_initcall(), so can be marked __init. The driver can't be built as
> a module.
> 
> 

Applied to powerpc/next.

[1/1] macintosh/via-pmu: register_pmu_pm_ops() can be __init
      https://git.kernel.org/powerpc/c/a5a670df1db79f4bb462601aa4cc03caffa761a2

cheers
