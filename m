Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D880337681
	for <linux-m68k@lists.linux-m68k.org>; Thu, 28 Aug 2025 17:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756402315; cv=none; b=Jso/IcXHfui/yfqjQL5QuD85gOJtu/DyaVYx1m6MWEW7G1I4Dxcopi49KNWrthivaJmHSk4Uel2OkN06GjJON8BCjoNL3cvM0YoutX4c/hrllbGuFRocpGJ6g6gzN/sN//uEvUbOTn+XXdjyjvU0iE/76r6IzPQDnBqML9Wc8GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756402315; c=relaxed/simple;
	bh=vl9K/umacKTfK8n27M0KwHBfAPbKCprrGgu7yc+VISM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Nfslcaly4WqfyZq3WM+M+7Pnk/Upg7m/61hlmAANPXJhIVtDkY+39Xw9cSm65Vy6Ttx1xayvzfpv7untdDS3A6Qc4yhIkiNP/LVALvqkmjzMnywPMLvspR6DAtIBOQzJoCi2IWvxaqbmv/3ENNQ5teLWvraEMuOi6LQyQeBLQ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nm8QlKSU; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nm8QlKSU"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE08840BC1;
	Thu, 28 Aug 2025 17:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DAD3C4CEEB;
	Thu, 28 Aug 2025 17:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756402312;
	bh=vl9K/umacKTfK8n27M0KwHBfAPbKCprrGgu7yc+VISM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Nm8QlKSUyPe3Gf+UCV04JeGw8KneAP2RaHR1A4YbseNmdkgRMIY3thPtQ/OAYQiqm
	 rp3ocwBxMk/z+rHqd3B3InJvp1jblMILJ8F44Ut8sekeJqhuMCpm+VVbun3jgnT//q
	 q0lW/PAxNv/v+VJ6n0eT+l5UxBBHcIAWlsXm/8Q5IroJBUY9QpO12Xnvn9FXHPslGE
	 sHC5eDUO0UKs2FOZh0vS5hlguumDWK8S8lyFXrZ9svJWpBcdmUBMxo7iH7EljoSAk4
	 QTHLNxoCXsQjUo/wNZpIa9zzlYtq6gjBnxsDClXPPdwPYrbU2icH59w927cENgcDjw
	 K4izz/zKsSrjw==
Date: Thu, 28 Aug 2025 12:31:51 -0500
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
	LKML <linux-kernel@vger.kernel.org>,
	=?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 00/24] PCI: Bridge window selection improvements
Message-ID: <20250828173151.GA950809@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d209c08a-56df-5aac-869d-7c6c548c0614@linux.intel.com>

On Thu, Aug 28, 2025 at 07:47:06PM +0300, Ilpo Järvinen wrote:
> On Wed, 27 Aug 2025, Bjorn Helgaas wrote:
> > On Fri, Aug 22, 2025 at 05:55:41PM +0300, Ilpo Järvinen wrote:
> > > This series is based on top of the three resource fitting and
> > > assignment algorithm fixes (v3).
> > > 
> > > PCI resource fitting and assignment code needs to find the bridge
> > > window a resource belongs to in multiple places, yet, no common
> > > function for that exists. Thus, each site has its own version of
> > > the decision, each with their own corner cases, misbehaviors, and
> > > some resulting in complex interfaces between internal functions.
> > > ...

> I'll need to do minor corrections into a few intermediate patches though 
> to ensure bisectability, we really want to make this as bisectable as 
> possible. In other words, I've found 2 relatively small issues in them 
> which won't change the end result when the whole series is complete and 
> fixed some small grammar errors in the changelogs.
> 
> I see you made some corrections so I'm not sure what's the best course of 
> action here to update them. Should I just send v2 normally and you deal 
> with your changes while replacing v1 with v2?

That would work for me.  Or if you picked the patches from
pci/resource and posted a v2 based on them, that would be even easier
for me.
