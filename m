Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC123212549
	for <linux-m68k@lists.linux-m68k.org>; Fri,  7 Nov 2025 00:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762474374; cv=none; b=Tg8ysvJ1pPRTNOM5GJ/XqVTAhlVOjuoh/d7H/EBagQEZzerxvpALXam8JfBt/7iXIrgo/Hmi/Xwf/gvvZjR0pyFSEtIs5q8iGvqTeQ5x3ONKLIlo71y9+uTg9BvxO67NX5vL5tockf/ByYbrckcsqMA1y8ZkISX+j96EVrRs+L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762474374; c=relaxed/simple;
	bh=zVxtIiQXF/h3lLGX+vTX4ScikwyurKS7hUPFV5evgT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=aLjhbVpEiekavoseM1K2zntIYcnFfAaWH9Vgm7ajVh3CJtgmh1HT3AkER/8ao4TMBdkL21XtCjpYOkD7NnrbGtVHmTZbiXNM82a8K3OBdyivfeXN73qPtdLVTrH29dRPw5niJMogWP/hhcYVilj8KKRjYiejtn9gAX0laEe4JoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arLi1sXK; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arLi1sXK"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 55511601A7;
	Fri,  7 Nov 2025 00:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0F1C4CEFB;
	Fri,  7 Nov 2025 00:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762474371;
	bh=zVxtIiQXF/h3lLGX+vTX4ScikwyurKS7hUPFV5evgT4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=arLi1sXKCOwj5bu+tukL49Vo2iKLJWUsqpLupqoRVBsB+qXse1CVN9RDSb3fOdmz0
	 QWq+nqXxO6RDUAYD5duqY3eDg4gHTyBzD/i68NgZ2QkpJ6ydS9Bb2FQzOQpPKWj6vz
	 bXYRTGV9r6zODcS1pIFaOYL4UGDie/fNdCt2WEedrIO50EsyjA+nOsrXtKoZub5BKl
	 jDZCQ8MH3S60cl138FURAdotszxxo8Q2T6iL0D/iOje6ZfuODWgWtANGpLjPjKU9Fp
	 h9YpZQQKVGWFV0rRMe/n3+geqebX703u7a4gtQFv7Zu+9PjvF4cnGRAKvTPfzEwtq+
	 q8rhLXwIRWrPA==
Date: Thu, 6 Nov 2025 18:12:49 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andreas Larsson <andreas@gaisler.com>,
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
	linuxppc-dev@lists.ozlabs.org, regressions@leemhuis.info
Subject: Re: [PATCH 02/24] sparc/PCI: Remove pcibios_enable_device() as they
 do nothing extra
Message-ID: <20251107001249.GA1977735@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fcc0fd4b74f99d5c4d80d3907e7607a7d4c89da.camel@physik.fu-berlin.de>

On Thu, Nov 06, 2025 at 08:49:50AM +0100, John Paul Adrian Glaubitz wrote:
> On Fri, 2025-08-22 at 17:55 +0300, Ilpo Järvinen wrote:
> > Under arch/sparc/ there are multiple copies of pcibios_enable_device()
> > but none of those seem to do anything extra beyond what
> > pci_enable_resources() is supposed to do. These functions could lead to
> > inconsistencies in behavior, especially now as pci_enable_resources()
> > and the bridge window resource flags behavior are going to be altered
> > by upcoming changes.

> This change actually broke driver initialization on SPARC, see:
> 
> https://github.com/sparclinux/issues/issues/22

#regzbot report: https://github.com/sparclinux/issues/issues/22
#regzbot introduced: 754babaaf333
#regzbot title: v6.18-rc3 fails to initialise mpt3sas on sparc T5-2

754babaaf333 ("sparc/PCI: Remove pcibios_enable_device() as they do nothing extra")
