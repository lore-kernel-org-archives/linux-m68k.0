Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD232D7804
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Oct 2025 09:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759829026; cv=none; b=F6sh+IuQE3v9Tf3yRkE7QneM19tu/6tFzLxG9X+x3vybw66RoLRmIkVZR51U+0nopStRDDrN9A72K5HrQEK36WAonk2q78UmHOSaiY4/PeorESyTJ8pX/769wavXLLu8k+uAhqeYyni/x+sZ+QdHph3Quv1JboRvbnyH03B2VIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759829026; c=relaxed/simple;
	bh=1OeXF7gTwGHtpMbzV5wweaCOtSArrdR207QvrmykQiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCatw3Bm3FEgAteOdMMMJBVSeWclwrwuIksJmWBQB2a77HC5xLL08BlelJ/uatBR7C0xfycPmszCiCUGxe92MkrKMT3b/22Y4yevg8KLmbqkI52+6ZozelA9zcacp3kIn+MkGY8EblKGIKlTh2NuCTECZkuH4eZK178nDaBdzWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=BlF1kOc8; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="BlF1kOc8"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-782bfd0a977so5195657b3a.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Oct 2025 02:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1759829024; x=1760433824; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+CusO7hLt+9Y9wt+DVMqJ4BTyt8WBGC9ci0HN6flQk=;
        b=BlF1kOc8cjtUyIQCz//7zaAMy9LpXQ1VlQ/PrrxdmNy/97PF6oAfMi8eVLdMaxcA3r
         NUjlSbVxxCeGWlCFMJnMZP2BMnkPRtnZVwYhJpWKh5/s2UmhZssh2yrVEotTzdCCcxWy
         F4Tnqtm+BbpkSf2OzGqrU6PIc50Zgg73+6bmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759829024; x=1760433824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+CusO7hLt+9Y9wt+DVMqJ4BTyt8WBGC9ci0HN6flQk=;
        b=NE3h/3tOAOx/YXghAY4UVxUoQMs37bY/ZGD0dACu1K9CKuSpiS6ku54ZWl7M+r2nFe
         In4naoHs7t5d1PJ/zvCm2fotNbZjG1yBxP7E4qjHFIjEKexEw/JdlMHhifT81fqHDWKV
         LY0b4iTPLAlklJCNsRGxr7McNSOQq4/U7GQDDCz7oAOqJirAeg7Vwut4E/HOSPScMCTJ
         CmzIZNaOYyWmx3ecwtofe41I7z/o43kVthZIxCil1+zfwfjzgjmMzMvAdxqCy84LTPX2
         OSIIkX3ZIuNa5KTrOckkpFoskbZQpd5c5vtkzA0/h6a5yjY2sK4pJYeZboikAXFZjD9C
         l3zw==
X-Gm-Message-State: AOJu0YyG+urM6pxIQ6GnindePeV8DxQGLBMjeY4VrxnJ3Jc75qSKXPXy
	9C6vvmzjEV6ap9adVoKO0rzM++k6doOhLSxscKqwRubYZ/AX6gFPPlx+EVw3t0cIyCmYhAmDkP+
	wF/EB8CU=
X-Gm-Gg: ASbGncuihEAMZMFdT9Ib9ifgAgfc5GLgZs8xHevRkviLkxRnfIOeTZWQd/4L0J8CsTz
	QueAtzPkF0YDCCfNaCI2loz4saxIRjJP1XnMquvc+B8g5g3mVWVrQoszhfLm9oRsZSndsRGzi5f
	xrDJ99B7ifLXaaRVa2FUs53dGb+a0fSj24TgaY13+FxD9Q0EuWnn1PF6m8S5a49pDL6i4mHOWTA
	ksM3g4XOhm5JTBI1A84KcAsjNxSWPs6NuYxhD2fG/klT4RHC2EZnKBr5QPuWU/bOTZds3e60H+t
	uAcJ7P8OfJ4s2QJUnXIQBZwhHV/OFu/P6e8qlGD8naCsAt52r8rX72kFfl6ZxhsbnB4UhWJGXGk
	rNyQTm5UnTHERHfRAz/QUdS/kW99o9msQBczEu+AJYaEpVWHRMqrySe/1ZPuD5LWWlVfh5AB36+
	mwCeTm/oXBrLvRy220D6rCdBCZrOMiXiqUQn0=
X-Google-Smtp-Source: AGHT+IF4MSf04NQohlmDVk/NVGrQyb6JbvrOwZqAVxAqJ3miglfPpesBhHPBayxboRAG5nUUyIX4Ow==
X-Received: by 2002:a05:6a00:3d51:b0:772:4319:e7df with SMTP id d2e1a72fcca58-78c98df9feemr14525251b3a.30.1759829023784;
        Tue, 07 Oct 2025 02:23:43 -0700 (PDT)
Received: from kinako.work.home.arpa (p1522181-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.198.181])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-78b01f99acesm15123273b3a.5.2025.10.07.02.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:23:43 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-m68k@lists.linux-m68k.org,
	linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [RFC PATCH 5/5] PCI: Add driver for Elbox Mediator 4000 Zorro->PCI bridge
Date: Tue,  7 Oct 2025 18:23:13 +0900
Message-ID: <20251007092313.755856-6-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007092313.755856-1-daniel@thingy.jp>
References: <20251007092313.755856-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Mediator 4000 is pretty simple:
- There is one "board" in the zorro space that has 2 registers to
  set the base address of the PCI memory address space in the
  machine address space and handle interrupts, and then windows
  to address the PCI config space and PCI IO space.

- Another board that contains the PCI memory address space inside
  of a window of 256MB or 512MB (configured by a jumper).

Since the hardware has no official documentation I cooked this
up using the WinUAE emulated version to work out how it mostly
works then confirmed it still worked on my real Amiga 4000.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 drivers/pci/controller/Kconfig            |  11 +
 drivers/pci/controller/Makefile           |   1 +
 drivers/pci/controller/pci-mediator4000.c | 314 ++++++++++++++++++++++
 3 files changed, 326 insertions(+)
 create mode 100644 drivers/pci/controller/pci-mediator4000.c

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 41748d083b93..3fb977318123 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -215,6 +215,17 @@ config PCIE_MEDIATEK_GEN3
 	  Say Y here if you want to enable Gen3 PCIe controller support on
 	  MediaTek SoCs.
 
+config PCI_MEDIATOR4000
+	tristate "Elbox Mediator 4000 Zorro->PCI bridge"
+	depends on AMIGA
+	select IRQ_DOMAIN
+	help
+	  Adds support for the Elbox Mediator 4000 Zorro->PCI bridge for
+	  the Amiga 4000.
+
+	  Say Y here if you are one of the few people that has this hardware
+	  and run Linux on it.
+
 config PCIE_MT7621
 	tristate "MediaTek MT7621 PCIe controller"
 	depends on SOC_MT7621 || COMPILE_TEST
diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Makefile
index 038ccbd9e3ba..03cd529716ec 100644
--- a/drivers/pci/controller/Makefile
+++ b/drivers/pci/controller/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_PCI_LOONGSON) += pci-loongson.o
 obj-$(CONFIG_PCIE_HISI_ERR) += pcie-hisi-error.o
 obj-$(CONFIG_PCIE_APPLE) += pcie-apple.o
 obj-$(CONFIG_PCIE_MT7621) += pcie-mt7621.o
+obj-$(CONFIG_PCI_MEDIATOR4000) += pci-mediator4000.o
 
 # pcie-hisi.o quirks are needed even without CONFIG_PCIE_DW
 obj-y				+= dwc/
diff --git a/drivers/pci/controller/pci-mediator4000.c b/drivers/pci/controller/pci-mediator4000.c
new file mode 100644
index 000000000000..106cde263e2c
--- /dev/null
+++ b/drivers/pci/controller/pci-mediator4000.c
@@ -0,0 +1,314 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include <asm/amigaints.h>
+#include <linux/irqdomain.h>
+#include <linux/pci.h>
+#include <linux/slab.h>
+#include <linux/zorro.h>
+
+/* Offsets etc */
+#define MEDIATOR4000_CONTROL			0x0
+#define MEDIATOR4000_CONTROL_SIZE		0x4
+#define MEDIATOR4000_CONTROL_WINDOW		0x0
+#define MEDIATOR4000_CONTROL_WINDOW_SHIFT	0x18
+#define MEDIATOR4000_CONTROL_IRQ		0x4
+#define MEDIATOR4000_CONTROL_IRQ_MASK_SHIFT	0x4
+#define MEDIATOR4000_PCICONF			0x800000
+#define MEDIATOR4000_PCICONF_SIZE		0x400000
+#define MEDIATOR4000_PCICONF_DEV_STRIDE		0x800
+#define MEDIATOR4000_PCICONF_FUNC_STRIDE	0x100
+#define MEDIATOR4000_PCIIO			0xc00000
+#define MEDIATOR4000_PCIIO_SIZE			0x100000
+
+/* How the Amiga sees the mediator 4000 */
+#define MEDIATOR4000_IRQ	IRQ_AMIGA_PORTS
+#define MEDIATOR4000_ID_CONTROL	ZORRO_ID(ELBOX_COMPUTER, 0x21, 0)
+#define MEDIATOR4000_ID_WINDOW	ZORRO_ID(ELBOX_COMPUTER, 0x21 | 0x80, 0)
+
+/*
+ * There are a few versions of the PCI backplane board,
+ * at most there are 6 slots it seems.
+ */
+#define MEDIATOR4000_MAX_SLOTS 6
+
+#define MEDIATOR4000_PCICONF_DEVFUNC_OFF(priv, devfn)		\
+	(priv->config_base +					\
+	(MEDIATOR4000_PCICONF_DEV_STRIDE * PCI_SLOT(devfn)) +	\
+	(MEDIATOR4000_PCICONF_FUNC_STRIDE * PCI_FUNC(devfn)))
+
+struct pci_mediator4000_priv {
+	struct resource pciio_res;
+	unsigned long config_base;
+	unsigned long setup_base;
+	struct irq_domain *irqdomain;
+	int irqmap[PCI_NUM_INTX];
+};
+
+static int pci_mediator4000_readconfig(struct pci_bus *bus, unsigned int devfn,
+				       int where, int size, u32 *value)
+{
+	struct pci_mediator4000_priv *priv = bus->sysdata;
+	unsigned long addr = MEDIATOR4000_PCICONF_DEVFUNC_OFF(priv, devfn) + where;
+	u32 v;
+
+	if (PCI_SLOT(devfn) >= MEDIATOR4000_MAX_SLOTS)
+		return PCIBIOS_FUNC_NOT_SUPPORTED;
+
+	/* Apparently only reading longs works */
+	v = z_readl(addr & ~0x3);
+
+	switch (size) {
+	case 4:
+		v = le32_to_cpu(v);
+		break;
+	case 2:
+		v = le16_to_cpu(((u16 *)(&v))[(addr & 0x3) >> 1]);
+		break;
+	case 1:
+		v = ((u8 *)&v)[addr & 0x3];
+		break;
+	default:
+		return PCIBIOS_FUNC_NOT_SUPPORTED;
+	}
+
+	*value = v;
+
+	return PCIBIOS_SUCCESSFUL;
+}
+
+static int pci_mediator4000_writeconfig(struct pci_bus *bus, unsigned int devfn,
+					int where, int size, u32 value)
+{
+	struct pci_mediator4000_priv *priv = bus->sysdata;
+	unsigned long addr = MEDIATOR4000_PCICONF_DEVFUNC_OFF(priv, devfn) + where;
+	u32 v;
+
+	if (PCI_SLOT(devfn) >= MEDIATOR4000_MAX_SLOTS)
+		return PCIBIOS_FUNC_NOT_SUPPORTED;
+
+	/* If its a long just write it */
+	if (size == 4) {
+		v = cpu_to_le32(value);
+		z_writel(v, addr);
+		return PCIBIOS_SUCCESSFUL;
+	}
+
+	/* Not a long, do RMW */
+	v = z_readl(addr & ~0x3);
+
+	switch (size) {
+	case 2:
+		((u16 *)(&v))[(addr & 0x3) >> 1] = cpu_to_le16((u16)value);
+		break;
+	case 1:
+		((u8 *)(&v))[addr & 0x3] = value;
+		break;
+	default:
+		return PCIBIOS_FUNC_NOT_SUPPORTED;
+	}
+
+	z_writel(v, addr & ~0x3);
+
+	return PCIBIOS_SUCCESSFUL;
+}
+
+static irqreturn_t pci_mediator4000_irq(int irq, void *dev_id)
+{
+	struct pci_mediator4000_priv *priv = dev_id;
+	u8 v = z_readb(priv->setup_base + MEDIATOR4000_CONTROL_IRQ);
+	unsigned long mask = v & 0xf;
+	int i;
+
+	for_each_set_bit(i, &mask, PCI_NUM_INTX)
+		generic_handle_domain_irq(priv->irqdomain, i);
+
+	return IRQ_HANDLED;
+}
+
+static int pci_mediator4000_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
+{
+	struct pci_mediator4000_priv *priv = dev->bus->sysdata;
+
+	/*
+	 * I'm not actually sure how the lines are wired on
+	 * mediators with more than 4 slots. My 4 slot board seems to just
+	 * have slot number == irq.
+	 */
+	return priv->irqmap[slot % PCI_NUM_INTX];
+}
+
+static struct pci_ops pci_mediator4000_ops = {
+	.read = pci_mediator4000_readconfig,
+	.write = pci_mediator4000_writeconfig,
+};
+
+static struct resource mediator4000_busn = {
+	.name = "mediator4000 busn",
+	.start = 0,
+	.end = 0,
+	.flags = IORESOURCE_BUS,
+};
+
+static void pci_mediator4000_mask_irq(struct irq_data *d)
+{
+	struct pci_mediator4000_priv *priv = irq_data_get_irq_chip_data(d);
+	u8 v = z_readb(priv->setup_base + MEDIATOR4000_CONTROL_IRQ);
+
+	v &= ~(BIT(irqd_to_hwirq(d)) << MEDIATOR4000_CONTROL_IRQ_MASK_SHIFT);
+	z_writeb(v, priv->setup_base + MEDIATOR4000_CONTROL_IRQ);
+}
+
+static void pci_mediator4000_unmask_irq(struct irq_data *d)
+{
+	struct pci_mediator4000_priv *priv = irq_data_get_irq_chip_data(d);
+	u8 v = z_readb(priv->setup_base + MEDIATOR4000_CONTROL_IRQ);
+
+	v |= (BIT(irqd_to_hwirq(d)) << MEDIATOR4000_CONTROL_IRQ_MASK_SHIFT);
+	z_writeb(v, priv->setup_base + MEDIATOR4000_CONTROL_IRQ);
+}
+
+static struct irq_chip pci_mediator4000_irq_chip = {
+	.name = "mediator4000",
+	.irq_mask = pci_mediator4000_mask_irq,
+	.irq_unmask = pci_mediator4000_unmask_irq,
+};
+
+static int pci_mediator4000_irq_map(struct irq_domain *domain, unsigned int irq,
+				    irq_hw_number_t hwirq)
+{
+	irq_set_chip_and_handler(irq, &pci_mediator4000_irq_chip, handle_level_irq);
+	irq_set_chip_data(irq, domain->host_data);
+
+	return 0;
+}
+
+static const struct irq_domain_ops pci_mediator4000_irqdomain_ops = {
+	.map = pci_mediator4000_irq_map,
+};
+
+static int mediator4000_setup(struct device *dev,
+			      struct zorro_dev *m4k_control,
+			      struct zorro_dev *m4k_window)
+{
+	unsigned long control_base = m4k_control->resource.start;
+	struct pci_mediator4000_priv *priv;
+	struct pci_host_bridge *bridge;
+	struct fwnode_handle *fwnode;
+	struct resource *res;
+	int i, ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ret = devm_request_irq(dev, MEDIATOR4000_IRQ, pci_mediator4000_irq,
+			       IRQF_SHARED, "mediator4000", priv);
+	if (ret)
+		return -ENODEV;
+
+	bridge = devm_pci_alloc_host_bridge(dev, 0);
+	if (!bridge)
+		return -ENOMEM;
+
+	res = devm_request_mem_region(dev, control_base + MEDIATOR4000_CONTROL,
+				      MEDIATOR4000_CONTROL_SIZE, "mediator4000-registers");
+	if (!res)
+		return -ENOMEM;
+
+	priv->setup_base = res->start;
+
+	/* Setup the window base */
+	z_writeb((m4k_window->resource.start >> MEDIATOR4000_CONTROL_WINDOW_SHIFT) & 0xf0,
+		 priv->setup_base + MEDIATOR4000_CONTROL_WINDOW);
+
+	res = devm_request_mem_region(dev, control_base + MEDIATOR4000_PCICONF,
+				 MEDIATOR4000_PCICONF_SIZE, "mediator4000-pci-config");
+	if (!res)
+		return -ENOMEM;
+
+	priv->config_base = res->start;
+
+	res = devm_request_mem_region(dev, control_base + MEDIATOR4000_PCIIO,
+				  MEDIATOR4000_PCIIO_SIZE, "mediator4000-pci-io");
+	if (!res)
+		return -ENOMEM;
+
+	priv->pciio_res.name = "mediator4000-pci-io",
+	priv->pciio_res.flags  = IORESOURCE_IO,
+	priv->pciio_res.start = res->start;
+	priv->pciio_res.end = res->end;
+	res = insert_resource_conflict(&ioport_resource, &priv->pciio_res);
+	if (res)
+		return -ENOMEM;
+
+	pci_add_resource_offset(&bridge->windows, &priv->pciio_res, priv->pciio_res.start);
+	pci_add_resource(&bridge->windows, &m4k_window->resource);
+	pci_add_resource(&bridge->windows, &mediator4000_busn);
+
+	/* fixme: PCI DMA can only happen inside the window? How to enforce that? */
+
+	bridge->sysdata = priv;
+	bridge->ops = &pci_mediator4000_ops;
+	bridge->swizzle_irq = pci_common_swizzle;
+	bridge->map_irq = pci_mediator4000_map_irq;
+
+	fwnode = irq_domain_alloc_named_fwnode("mediator4000");
+	if (!fwnode)
+		return -ENOMEM;
+
+	priv->irqdomain = irq_domain_create_linear(fwnode,
+						   PCI_NUM_INTX,
+						   &pci_mediator4000_irqdomain_ops,
+						   priv);
+	if (!priv->irqdomain) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	for (i = 0; i < PCI_NUM_INTX; i++)
+		priv->irqmap[i] = irq_create_mapping(priv->irqdomain, i);
+
+	ret = pci_host_probe(bridge);
+	if (!ret)
+		return 0;
+
+err:
+	irq_domain_free_fwnode(fwnode);
+	return ret;
+}
+
+static int pci_mediator4000_probe(struct zorro_dev *m4k_control,
+				  const struct zorro_device_id *ent)
+{
+	struct device *dev = &m4k_control->dev;
+	struct zorro_dev *m4k_window;
+
+	m4k_window = zorro_find_device(MEDIATOR4000_ID_WINDOW, m4k_control);
+	if (!m4k_window) {
+		dev_err(&m4k_control->dev, "Could not find window board\n");
+		return -ENODEV;
+	}
+
+	return mediator4000_setup(dev, m4k_control, m4k_window);
+}
+
+static const struct zorro_device_id pci_mediator4000_zorro_tbl[] = {
+	{
+		.id = MEDIATOR4000_ID_CONTROL,
+	},
+	{ 0 }
+};
+MODULE_DEVICE_TABLE(zorro, pci_mediator4000_zorro_tbl);
+
+static struct zorro_driver pci_mediator4000_driver = {
+	.name     = "pci_mediator4000",
+	.id_table = pci_mediator4000_zorro_tbl,
+	.probe    = pci_mediator4000_probe,
+};
+
+module_driver(pci_mediator4000_driver,
+	      zorro_register_driver,
+	      zorro_unregister_driver);
-- 
2.51.0

