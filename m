Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D725FDC0
	for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Feb 2024 15:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707836730; cv=none; b=OBDrj7U/09KzAPGiS5RtnUGQ2X4IaKliTSF35Yq26sHaVHtdtnpt27L9OdEDnmn8gvcjbQ3F4IRvAgq5nGfPpxsw8HFX+8GdoPF+o8oQhC8kZbdTQEoI//Zo2SNmxMG2eF9m7+EEPbZ7ZczsuZfxRkaBBUK5Ssc22JxbWt6e6ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707836730; c=relaxed/simple;
	bh=Qa6rVTdH4iQGyAAt2k4ZX9zqEob7WMbTmIXFs7XCOio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUflYaWU7dlnareAeQQvfBNz/E4ZD7m7qMXix8Dy1pIFviPiEsRTaTFdgipdiQZgZNq1P2ljg25YHpYMUs4y/05wUWfBGNBhsHtsepJRHjd7CvqvO9YS1N/tK6jPZ9goKxUVY3IljPOaVWnSK2OUggwHGy7d8riJEq6bMmma76Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H7C4M9rd; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H7C4M9rd"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F13C4CE1C9F;
	Tue, 13 Feb 2024 15:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7CC4C433F1;
	Tue, 13 Feb 2024 15:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707836725;
	bh=Qa6rVTdH4iQGyAAt2k4ZX9zqEob7WMbTmIXFs7XCOio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H7C4M9rdRXokWR0t+dcNMJMksJsOVh7lNpJoEITtBG8GNgSp1b7NVVg/ra3HOC043
	 YpNX14dvMfJz99sgnbH7n2TfY+D1NwlEq8GCH30cidPhdnShJ7HsV5GdhFnkd4/nuU
	 wv3m49EbmKNobmnROko2cMPV1f+dG/RL2sKfWAAs=
Date: Tue, 13 Feb 2024 16:05:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] zorro: make zorro_bus_type const
Message-ID: <2024021314-coyness-frosty-f8cc@gregkh>
References: <20240213-bus_cleanup-zorro-v1-1-388ceed8e7bd@marliere.net>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213-bus_cleanup-zorro-v1-1-388ceed8e7bd@marliere.net>

On Tue, Feb 13, 2024 at 11:41:25AM -0300, Ricardo B. Marliere wrote:
> Since commit d492cc2573a0 ("driver core: device.h: make struct
> bus_type a const *"), the driver core can properly handle constant
> struct bus_type, move the zorro_bus_type variable to be a constant
> structure as well, placing it into read-only memory which can not be
> modified at runtime.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> ---

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
