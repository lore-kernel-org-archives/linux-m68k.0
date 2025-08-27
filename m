Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8941D30F928
	for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Aug 2025 22:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756334171; cv=none; b=fiYPb01BRukC/rXorNaPzmkjwpzvtSWS9LKsoOLo2QjBCwyxqcdJEgCiRZ3lctStuQUKeUsG4MYAWjF4OZxKxuFxz/XSnnuEgiYI6S0wkf+pWyLjG7h0IsaA78a9hQEND1+Rszpy3VhirypybooCymGiNw/mBk/Bsnxy7J7zTmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756334171; c=relaxed/simple;
	bh=SuvtG9zPU1paS6zdtAQLH1EmQzS92Y488uepGCslfWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=kQsOZiUphXfFa9XuvT5W44UONE2tX3GW2woPShwHjlTd59YWk3eqRVmKx7E0P7zCiG14ylW7jOpPmtQy8GJWGQz43ISaSd8EPaJtlkfFz92OfF99xgRnw8oQ0Fpg1YQ9COHIvol3z9vqR0TLr8DnwtpZXeIvBpXfdb9AdPiwv6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUpxeAZt; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUpxeAZt"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F43E4433D;
	Wed, 27 Aug 2025 22:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C3EBC4CEEB;
	Wed, 27 Aug 2025 22:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756334168;
	bh=SuvtG9zPU1paS6zdtAQLH1EmQzS92Y488uepGCslfWI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=DUpxeAZt3sd2SF+CHF9cOy/FaqwBpkfO3QmQLN4WtjqYJww1JgdN330EJgtOo7awf
	 xyWVC65Ik9s82mLjd16u/fsvSuu23dv4M1YBxCe8bO6CXWEgzoRLhpV3WDHPmP25aY
	 MN84rM34MoHWDkORX0/iiQ1n3JoUADeR5wXKbBAovlj1sAMI5uZeJDeOfTYi0lz+zn
	 V5/DUusNTXr35xQCbizoSyjKjZgXsropAj0Da/2jC4EKIm5VEVn251opw5aNwUVvou
	 RRsuPYOe7vPF9M/TvmOxlhhB1X2T3hVX9lRk7L3x0iNPNnhqbMmQokcb4oci+E0njx
	 QPfbX1CvuOzSQ==
Date: Wed, 27 Aug 2025 17:36:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Andreas Larsson <andreas@gaisler.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-pci@vger.kernel.org, sparclinux@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Yinghai Lu <yinghai@kernel.org>,
	Igor Mammedov <imammedo@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org,
	=?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 00/24] PCI: Bridge window selection improvements
Message-ID: <20250827223606.GA915856@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822145605.18172-1-ilpo.jarvinen@linux.intel.com>

On Fri, Aug 22, 2025 at 05:55:41PM +0300, Ilpo Järvinen wrote:
> This series is based on top of the three resource fitting and
> assignment algorithm fixes (v3).
> 
> PCI resource fitting and assignment code needs to find the bridge
> window a resource belongs to in multiple places, yet, no common
> function for that exists. Thus, each site has its own version of
> the decision, each with their own corner cases, misbehaviors, and
> some resulting in complex interfaces between internal functions.
> ...

> I've tried to look out for any trouble that code under arch/ could
> cause after the flags start to behave differently and therefore ended
> up consolidating arch/ code to use pci_enable_resources(). My
> impression is that strictly speaking only the MIPS code would break
> similar to PCI core's copy of pci_enable_resources(), the others were
> much more lax in checking so they'd likely keep working but
> consolidation seemed still the best approach there as the enable checks
> seemed diverging for no apparent reason.
> ...

>   m68k/PCI: Use pci_enable_resources() in pcibios_enable_device()
>   sparc/PCI: Remove pcibios_enable_device() as they do nothing extra
>   MIPS: PCI: Use pci_enable_resources()
> ...

>  arch/m68k/kernel/pcibios.c   |  39 +-
>  arch/mips/pci/pci-legacy.c   |  38 +-
>  arch/sparc/kernel/leon_pci.c |  27 --
>  arch/sparc/kernel/pci.c      |  27 --
>  arch/sparc/kernel/pcic.c     |  27 --
> ...

I love the fact that you're doing so much cleanup.  Thanks for all the
work in this!

Obviously all this code is quite sensitive, so I put it on
pci/resource to get more exposure in -next.  If it turns out that we
trip over things or just don't feel comfortable yet for v6.18, we can
always defer this part until the next cycle.

I will also watch for acks from the m68k, mips, and sparc maintainers
for those pieces.

Bjorn
