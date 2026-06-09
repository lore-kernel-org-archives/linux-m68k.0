Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C996431F99E
	for <linux-m68k@lists.linux-m68k.org>; Tue,  9 Jun 2026 05:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780983112; cv=none; b=ODLjucBipy2gJAyRPEk92GKGy8hsmFSA6OueMYwYGGq7IoV0+1lWUT0+F65Qe2QsQkK7qeRQMCKOBv3pdn6hWN0woTS9cmWyz6dXjzX8cFzZTiqLKmOzxRZRYKUY1tew90k/wn1lyNCEWOVof91KmstXN+b8dOyES4IWGa3HneQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780983112; c=relaxed/simple;
	bh=N1tSz0WfDaCJhOS0IGgSj9qi0hu8FB5rtygEVzNePOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZnE6CafNnvAYV6qAGC4r0VrZ3/KsjRwPVsZcma9+FCsPdE+Qz0qzy7xsFZVk0rXqLcNU7DnaEK3svukzYCVNOdpsGAHTu1pqLT27Q8phpHxPYRz+aNeEGJVV1K9dVbCk/4cZJHcwp6L3pSRG2KWqVAHLo8FWf5b2lq2dNBgUoWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HUojIW4+; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HUojIW4+"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 07FE9601E6;
	Tue,  9 Jun 2026 05:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D771F00893;
	Tue,  9 Jun 2026 05:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780983109;
	bh=4nHhNOei7QNfUzNrgd6b9zKAHktqrjJSs2tQI7XWv90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HUojIW4+spXliS/WJ9e0L7NRKhF43nwz9aw6NUlkgYwKcPTg2maOoeUcdMDkZXrl3
	 EAecWoTuok6//TMhj/wDkVEsx6wjgJGqGaAS09ejhEghuKdQy80zYGvv5CT8tXBo61
	 vR69FojFHwv32I3+mgvzzPXqixHjLsWV4DNdSQQ8=
Date: Tue, 9 Jun 2026 07:30:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH RESEND v2 1/2] serial: earlycon: add uart_clk_freq
 parameter
Message-ID: <2026060957-chaperone-tarot-d548@gregkh>
References: <20260609-acpi_spcr-v2-0-3cd9a3bda727@posteo.de>
 <20260609-acpi_spcr-v2-1-3cd9a3bda727@posteo.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-acpi_spcr-v2-1-3cd9a3bda727@posteo.de>

On Mon, Jun 08, 2026 at 10:40:21PM +0000, Markus Probst wrote:
> Add `uart_clk_freq` parameter to `setup_earlycon`. This allows the
> options string to be reused with `add_preferred_console`, while still
> allowing to set the uart clock frequency. This will be used in the
> following commit ("ACPI: SPCR: Support UART clock frequency field").

Ick, this is bad, now you need to look up what this 0 is as a parameter
every time you see this call.  Please just add a new function that takes
the new paramter, don't abuse the old one for this.

thanks,

greg k-h
