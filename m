From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 09/10] nubus: Clean up whitespace
Date: Sat,  8 Apr 2017 19:51:15 -0400 (EDT)
Message-ID: <e61b408a1065d0f988586e84fec5cadbb97f6622.1491695243.git.fthain@telegraphics.com.au>
References: <cover.1491695243.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1491695243.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/nubus/nubus.c | 284 ++++++++++++++++++++++++--------------------------
 1 file changed, 134 insertions(+), 150 deletions(-)

diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index eac5ec2..bb81347 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -35,8 +35,8 @@ extern void oss_nubus_init(void);
 
 /* Globals */
 
-struct nubus_dev*   nubus_devices;
-struct nubus_board* nubus_boards;
+struct nubus_dev *nubus_devices;
+struct nubus_board *nubus_boards;
 
 /* Meaning of "bytelanes":
 
@@ -60,26 +60,26 @@ struct nubus_board* nubus_boards;
 
    Etcetera, etcetera.  Hopefully this clears up some confusion over
    what the following code actually does.  */
- 
+
 static inline int not_useful(void *p, int map)
 {
-	unsigned long pv=(unsigned long)p;
+	unsigned long pv = (unsigned long)p;
+
 	pv &= 3;
-	if(map & (1<<pv))
+	if (map & (1 << pv))
 		return 0;
 	return 1;
 }
- 
+
 static unsigned long nubus_get_rom(unsigned char **ptr, int len, int map)
 {
 	/* This will hold the result */
 	unsigned long v = 0;
 	unsigned char *p = *ptr;
 
-	while(len)
-	{
+	while (len) {
 		v <<= 8;
-		while(not_useful(p,map))
+		while (not_useful(p, map))
 			p++;
 		v |= *p++;
 		len--;
@@ -90,27 +90,23 @@ static unsigned long nubus_get_rom(unsigned char **ptr, int len, int map)
 
 static void nubus_rewind(unsigned char **ptr, int len, int map)
 {
-	unsigned char *p=*ptr;
+	unsigned char *p = *ptr;
 
-	while(len)
-	{
-		do
-		{
+	while (len) {
+		do {
 			p--;
-		}
-		while(not_useful(p, map));
+		} while (not_useful(p, map));
 		len--;
 	}
-	*ptr=p;
+	*ptr = p;
 }
 
 static void nubus_advance(unsigned char **ptr, int len, int map)
 {
 	unsigned char *p = *ptr;
 
-	while(len)
-	{
-		while(not_useful(p,map))
+	while (len) {
+		while (not_useful(p, map))
 			p++;
 		p++;
 		len--;
@@ -122,9 +118,9 @@ static void nubus_move(unsigned char **ptr, int len, int map)
 {
 	unsigned long slot_space = (unsigned long)*ptr & 0xFF000000;
 
-	if(len > 0)
+	if (len > 0)
 		nubus_advance(ptr, len, map);
-	else if(len < 0)
+	else if (len < 0)
 		nubus_rewind(ptr, -len, map);
 
 	if (((unsigned long)*ptr & 0xFF000000) != slot_space)
@@ -140,23 +136,24 @@ static void nubus_move(unsigned char **ptr, int len, int map)
 
 static inline long nubus_expand32(long foo)
 {
-	if(foo & 0x00800000)	/* 24bit negative */
+	if (foo & 0x00800000)	/* 24bit negative */
 		foo |= 0xFF000000;
 	return foo;
 }
 
 static inline void *nubus_rom_addr(int slot)
-{	
+{
 	/*
 	 *	Returns the first byte after the card. We then walk
 	 *	backwards to get the lane register and the config
 	 */
-	return (void *)(0xF1000000+(slot<<24));
+	return (void *)(0xF1000000 + (slot << 24));
 }
 
 static unsigned char *nubus_dirptr(const struct nubus_dirent *nd)
 {
 	unsigned char *p = nd->base;
+
 	/* Essentially, just step over the bytelanes using whatever
 	   offset we might have found */
 	nubus_move(&p, nubus_expand32(nd->data), nd->mask);
@@ -167,36 +164,36 @@ static unsigned char *nubus_dirptr(const struct nubus_dirent *nd)
 /* These two are for pulling resource data blocks (i.e. stuff that's
    pointed to with offsets) out of the card ROM. */
 
-void nubus_get_rsrc_mem(void *dest, const struct nubus_dirent* dirent,
+void nubus_get_rsrc_mem(void *dest, const struct nubus_dirent *dirent,
 			int len)
 {
 	unsigned char *t = (unsigned char *)dest;
 	unsigned char *p = nubus_dirptr(dirent);
-	while(len)
-	{
+
+	while (len) {
 		*t++ = nubus_get_rom(&p, 1, dirent->mask);
 		len--;
 	}
 }
 EXPORT_SYMBOL(nubus_get_rsrc_mem);
 
-void nubus_get_rsrc_str(void *dest, const struct nubus_dirent* dirent,
+void nubus_get_rsrc_str(void *dest, const struct nubus_dirent *dirent,
 			int len)
 {
-	unsigned char *t=(unsigned char *)dest;
+	unsigned char *t = (unsigned char *)dest;
 	unsigned char *p = nubus_dirptr(dirent);
-	while(len)
-	{
+
+	while (len) {
 		*t = nubus_get_rom(&p, 1, dirent->mask);
-		if(!*t++)
+		if (!*t++)
 			break;
 		len--;
 	}
 }
 EXPORT_SYMBOL(nubus_get_rsrc_str);
 
-int nubus_get_root_dir(const struct nubus_board* board,
-		       struct nubus_dir* dir)
+int nubus_get_root_dir(const struct nubus_board *board,
+		       struct nubus_dir *dir)
 {
 	dir->ptr = dir->base = board->directory;
 	dir->done = 0;
@@ -206,8 +203,8 @@ int nubus_get_root_dir(const struct nubus_board* board,
 EXPORT_SYMBOL(nubus_get_root_dir);
 
 /* This is a slyly renamed version of the above */
-int nubus_get_func_dir(const struct nubus_dev* dev,
-		       struct nubus_dir* dir)
+int nubus_get_func_dir(const struct nubus_dev *dev,
+		       struct nubus_dir *dir)
 {
 	dir->ptr = dir->base = dev->directory;
 	dir->done = 0;
@@ -216,11 +213,11 @@ int nubus_get_func_dir(const struct nubus_dev* dev,
 }
 EXPORT_SYMBOL(nubus_get_func_dir);
 
-int nubus_get_board_dir(const struct nubus_board* board,
-			struct nubus_dir* dir)
+int nubus_get_board_dir(const struct nubus_board *board,
+			struct nubus_dir *dir)
 {
 	struct nubus_dirent ent;
-	
+
 	dir->ptr = dir->base = board->directory;
 	dir->done = 0;
 	dir->mask = board->lanes;
@@ -248,6 +245,7 @@ EXPORT_SYMBOL(nubus_get_subdir);
 int nubus_readdir(struct nubus_dir *nd, struct nubus_dirent *ent)
 {
 	u32 resid;
+
 	if (nd->done)
 		return -1;
 
@@ -258,27 +256,25 @@ int nubus_readdir(struct nubus_dir *nd, struct nubus_dirent *ent)
 	resid = nubus_get_rom(&nd->ptr, 4, nd->mask);
 
 	/* EOL marker, as per the Apple docs */
-	if((resid&0xff000000) == 0xff000000)
-	{
+	if ((resid & 0xff000000) == 0xff000000) {
 		/* Mark it as done */
 		nd->done = 1;
 		return -1;
 	}
 
 	/* First byte is the resource ID */
-	ent->type  = resid >> 24;
+	ent->type = resid >> 24;
 	/* Low 3 bytes might contain data (or might not) */
 	ent->data = resid & 0xffffff;
-	ent->mask  = nd->mask;
+	ent->mask = nd->mask;
 	return 0;
 }
 EXPORT_SYMBOL(nubus_readdir);
 
-int nubus_rewinddir(struct nubus_dir* dir)
+int nubus_rewinddir(struct nubus_dir *dir)
 {
 	dir->ptr = dir->base;
 	dir->done = 0;
-
 	return 0;
 }
 EXPORT_SYMBOL(nubus_rewinddir);
@@ -286,20 +282,15 @@ EXPORT_SYMBOL(nubus_rewinddir);
 /* Driver interface functions, more or less like in pci.c */
 
 struct nubus_dev*
-nubus_find_device(unsigned short category,
-		  unsigned short type,
-		  unsigned short dr_hw,
-		  unsigned short dr_sw,
-		  const struct nubus_dev* from)
+nubus_find_device(unsigned short category, unsigned short type,
+		  unsigned short dr_hw, unsigned short dr_sw,
+		  const struct nubus_dev *from)
 {
-	struct nubus_dev* itor =
-		from ? from->next : nubus_devices;
+	struct nubus_dev *itor = from ? from->next : nubus_devices;
 
 	while (itor) {
-		if (itor->category == category
-		    && itor->type == type
-		    && itor->dr_hw == dr_hw
-		    && itor->dr_sw == dr_sw)
+		if (itor->category == category && itor->type == type &&
+		    itor->dr_hw == dr_hw && itor->dr_sw == dr_sw)
 			return itor;
 		itor = itor->next;
 	}
@@ -308,16 +299,13 @@ nubus_find_device(unsigned short category,
 EXPORT_SYMBOL(nubus_find_device);
 
 struct nubus_dev*
-nubus_find_type(unsigned short category,
-		unsigned short type,
-		const struct nubus_dev* from)
+nubus_find_type(unsigned short category, unsigned short type,
+		const struct nubus_dev *from)
 {
-	struct nubus_dev* itor =
-		from ? from->next : nubus_devices;
+	struct nubus_dev *itor = from ? from->next : nubus_devices;
 
 	while (itor) {
-		if (itor->category == category
-		    && itor->type == type)
+		if (itor->category == category && itor->type == type)
 			return itor;
 		itor = itor->next;
 	}
@@ -326,12 +314,10 @@ nubus_find_type(unsigned short category,
 EXPORT_SYMBOL(nubus_find_type);
 
 struct nubus_dev*
-nubus_find_slot(unsigned int slot,
-		const struct nubus_dev* from)
+nubus_find_slot(unsigned int slot, const struct nubus_dev *from)
 {
-	struct nubus_dev* itor =
-		from ? from->next : nubus_devices;
-	
+	struct nubus_dev *itor = from ? from->next : nubus_devices;
+
 	while (itor) {
 		if (itor->board->slot == slot)
 			return itor;
@@ -342,13 +328,13 @@ nubus_find_slot(unsigned int slot,
 EXPORT_SYMBOL(nubus_find_slot);
 
 int
-nubus_find_rsrc(struct nubus_dir* dir, unsigned char rsrc_type,
-		struct nubus_dirent* ent)
+nubus_find_rsrc(struct nubus_dir *dir, unsigned char rsrc_type,
+		struct nubus_dirent *ent)
 {
 	while (nubus_readdir(dir, ent) != -1) {
 		if (ent->type == rsrc_type)
 			return 0;
-	}	
+	}
 	return -1;
 }
 EXPORT_SYMBOL(nubus_find_rsrc);
@@ -362,8 +348,8 @@ EXPORT_SYMBOL(nubus_find_rsrc);
    among other things.  The rest of it should go in the /proc code.
    For now, we just use it to give verbose boot logs. */
 
-static int __init nubus_show_display_resource(struct nubus_dev* dev,
-					      const struct nubus_dirent* ent)
+static int __init nubus_show_display_resource(struct nubus_dev *dev,
+					      const struct nubus_dirent *ent)
 {
 	switch (ent->type) {
 	case NUBUS_RESID_GAMMADIR:
@@ -380,14 +366,14 @@ static int __init nubus_show_display_resource(struct nubus_dev* dev,
 	return 0;
 }
 
-static int __init nubus_show_network_resource(struct nubus_dev* dev,
-					      const struct nubus_dirent* ent)
+static int __init nubus_show_network_resource(struct nubus_dev *dev,
+					      const struct nubus_dirent *ent)
 {
 	switch (ent->type) {
 	case NUBUS_RESID_MAC_ADDRESS:
 	{
 		char addr[6];
-		
+
 		nubus_get_rsrc_mem(addr, ent, 6);
 		pr_info("    MAC address: %pM\n", addr);
 		break;
@@ -399,13 +385,14 @@ static int __init nubus_show_network_resource(struct nubus_dev* dev,
 	return 0;
 }
 
-static int __init nubus_show_cpu_resource(struct nubus_dev* dev,
-					  const struct nubus_dirent* ent)
+static int __init nubus_show_cpu_resource(struct nubus_dev *dev,
+					  const struct nubus_dirent *ent)
 {
 	switch (ent->type) {
 	case NUBUS_RESID_MEMINFO:
 	{
 		unsigned long meminfo[2];
+
 		nubus_get_rsrc_mem(&meminfo, ent, 8);
 		pr_info("    memory: [ 0x%08lx 0x%08lx ]\n",
 		       meminfo[0], meminfo[1]);
@@ -414,6 +401,7 @@ static int __init nubus_show_cpu_resource(struct nubus_dev* dev,
 	case NUBUS_RESID_ROMINFO:
 	{
 		unsigned long rominfo[2];
+
 		nubus_get_rsrc_mem(&rominfo, ent, 8);
 		pr_info("    ROM:    [ 0x%08lx 0x%08lx ]\n",
 		       rominfo[0], rominfo[1]);
@@ -426,8 +414,8 @@ static int __init nubus_show_cpu_resource(struct nubus_dev* dev,
 	return 0;
 }
 
-static int __init nubus_show_private_resource(struct nubus_dev* dev,
-					      const struct nubus_dirent* ent)
+static int __init nubus_show_private_resource(struct nubus_dev *dev,
+					      const struct nubus_dirent *ent)
 {
 	switch (dev->category) {
 	case NUBUS_CAT_DISPLAY:
@@ -446,15 +434,14 @@ static int __init nubus_show_private_resource(struct nubus_dev* dev,
 	return 0;
 }
 
-static struct nubus_dev* __init
-	   nubus_get_functional_resource(struct nubus_board* board,
-					 int slot,
-					 const struct nubus_dirent* parent)
+static struct nubus_dev * __init
+nubus_get_functional_resource(struct nubus_board *board, int slot,
+			      const struct nubus_dirent *parent)
 {
-	struct nubus_dir    dir;
+	struct nubus_dir dir;
 	struct nubus_dirent ent;
-	struct nubus_dev*   dev;
-	
+	struct nubus_dev *dev;
+
 	pr_info("  Function 0x%02x:\n", parent->type);
 	nubus_get_subdir(parent, &dir);
 
@@ -463,18 +450,17 @@ static struct nubus_dev* __init
 
 	/* Actually we should probably panic if this fails */
 	if ((dev = kzalloc(sizeof(*dev), GFP_ATOMIC)) == NULL)
-		return NULL;	
+		return NULL;
 	dev->resid = parent->type;
 	dev->directory = dir.base;
 	dev->board = board;
-	
-	while (nubus_readdir(&dir, &ent) != -1)
-	{
-		switch(ent.type)
-		{
+
+	while (nubus_readdir(&dir, &ent) != -1) {
+		switch (ent.type) {
 		case NUBUS_RESID_TYPE:
 		{
 			unsigned short nbtdata[4];
+
 			nubus_get_rsrc_mem(nbtdata, &ent, 8);
 			dev->category = nbtdata[0];
 			dev->type     = nbtdata[1];
@@ -496,6 +482,7 @@ static struct nubus_dev* __init
 			   use this :-) */
 			struct nubus_dir drvr_dir;
 			struct nubus_dirent drvr_ent;
+
 			nubus_get_subdir(&ent, &drvr_dir);
 			nubus_readdir(&drvr_dir, &drvr_ent);
 			dev->driver = nubus_dirptr(&drvr_ent);
@@ -528,16 +515,17 @@ static struct nubus_dev* __init
 			nubus_show_private_resource(dev, &ent);
 		}
 	}
-		
+
 	return dev;
 }
 
 /* This is cool. */
-static int __init nubus_get_vidnames(struct nubus_board* board,
-				     const struct nubus_dirent* parent)
+static int __init nubus_get_vidnames(struct nubus_board *board,
+				     const struct nubus_dirent *parent)
 {
-	struct nubus_dir    dir;
+	struct nubus_dir dir;
 	struct nubus_dirent ent;
+
 	/* FIXME: obviously we want to put this in a header file soon */
 	struct vidmode {
 		u32 size;
@@ -552,14 +540,13 @@ static int __init nubus_get_vidnames(struct nubus_board* board,
 	pr_debug("%s: parent is 0x%p, dir is 0x%p\n",
 	         __func__, parent->base, dir.base);
 
-	while(nubus_readdir(&dir, &ent) != -1)
-	{
+	while (nubus_readdir(&dir, &ent) != -1) {
 		struct vidmode mode;
 		u32 size;
 
 		/* First get the length */
 		nubus_get_rsrc_mem(&size, &ent, 4);
-		
+
 		/* Now clobber the whole thing */
 		if (size > sizeof(mode) - 1)
 			size = sizeof(mode) - 1;
@@ -572,13 +559,13 @@ static int __init nubus_get_vidnames(struct nubus_board* board,
 }
 
 /* This is *really* cool. */
-static int __init nubus_get_icon(struct nubus_board* board,
-				 const struct nubus_dirent* ent)
+static int __init nubus_get_icon(struct nubus_board *board,
+				 const struct nubus_dirent *ent)
 {
 	/* Should be 32x32 if my memory serves me correctly */
 	unsigned char icon[128];
 	int x, y;
-	
+
 	nubus_get_rsrc_mem(&icon, ent, 128);
 	pr_info("    icon:\n");
 
@@ -588,8 +575,7 @@ static int __init nubus_get_icon(struct nubus_board* board,
 	for (y = 0; y < 32; y++) {
 		pr_info("      ");
 		for (x = 0; x < 32; x++) {
-			if (icon[y*4 + x/8]
-			    & (0x80 >> (x%8)))
+			if (icon[y * 4 + x / 8] & (0x80 >> (x % 8)))
 				pr_cont("*");
 			else
 				pr_cont(" ");
@@ -599,23 +585,22 @@ static int __init nubus_get_icon(struct nubus_board* board,
 	return 0;
 }
 
-static int __init nubus_get_vendorinfo(struct nubus_board* board,
-				       const struct nubus_dirent* parent)
+static int __init nubus_get_vendorinfo(struct nubus_board *board,
+				       const struct nubus_dirent *parent)
 {
-	struct nubus_dir    dir;
+	struct nubus_dir dir;
 	struct nubus_dirent ent;
-	static char* vendor_fields[6] = {"ID", "serial", "revision",
-					 "part", "date", "unknown field"};
+	static char *vendor_fields[6] = { "ID", "serial", "revision",
+	                                  "part", "date", "unknown field" };
 
 	pr_info("    vendor info:\n");
 	nubus_get_subdir(parent, &dir);
 	pr_debug("%s: parent is 0x%p, dir is 0x%p\n",
 	         __func__, parent->base, dir.base);
 
-	while(nubus_readdir(&dir, &ent) != -1)
-	{
+	while (nubus_readdir(&dir, &ent) != -1) {
 		char name[64];
-		
+
 		/* These are all strings, we think */
 		nubus_get_rsrc_str(name, &ent, 64);
 		if (ent.type > 5)
@@ -625,18 +610,17 @@ static int __init nubus_get_vendorinfo(struct nubus_board* board,
 	return 0;
 }
 
-static int __init nubus_get_board_resource(struct nubus_board* board, int slot,
-					   const struct nubus_dirent* parent)
+static int __init nubus_get_board_resource(struct nubus_board *board, int slot,
+					   const struct nubus_dirent *parent)
 {
-	struct nubus_dir    dir;
+	struct nubus_dir dir;
 	struct nubus_dirent ent;
-	
+
 	nubus_get_subdir(parent, &dir);
 	pr_debug("%s: parent is 0x%p, dir is 0x%p\n",
 	         __func__, parent->base, dir.base);
 
-	while(nubus_readdir(&dir, &ent) != -1)
-	{
+	while (nubus_readdir(&dir, &ent) != -1) {
 		switch (ent.type) {
 		case NUBUS_RESID_TYPE:
 		{
@@ -677,7 +661,7 @@ static int __init nubus_get_board_resource(struct nubus_board* board, int slot,
 		case NUBUS_RESID_SECONDINIT:
 			pr_info("    secondary init offset: 0x%06x\n", ent.data);
 			break;
-			/* WTF isn't this in the functional resources? */ 
+			/* WTF isn't this in the functional resources? */
 		case NUBUS_RESID_VIDNAMES:
 			nubus_get_vidnames(board, &ent);
 			break;
@@ -685,7 +669,7 @@ static int __init nubus_get_board_resource(struct nubus_board* board, int slot,
 		case NUBUS_RESID_VIDMODES:
 			pr_info("    video mode parameter directory offset: 0x%06x\n",
 			       ent.data);
-			break;			
+			break;
 		default:
 			pr_info("    unknown resource %02X, data 0x%06x\n",
 			       ent.type, ent.data);
@@ -695,23 +679,22 @@ static int __init nubus_get_board_resource(struct nubus_board* board, int slot,
 }
 
 /* Add a board (might be many devices) to the list */
-static struct nubus_board* __init nubus_add_board(int slot, int bytelanes)
+static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
 {
-	struct nubus_board* board;
-	struct nubus_board** boardp;
-
+	struct nubus_board *board;
+	struct nubus_board **boardp;
 	unsigned char *rp;
 	unsigned long dpat;
 	struct nubus_dir dir;
 	struct nubus_dirent ent;
 
 	/* Move to the start of the format block */
-	rp = nubus_rom_addr(slot);		
+	rp = nubus_rom_addr(slot);
 	nubus_rewind(&rp, FORMAT_BLOCK_SIZE, bytelanes);
 
 	/* Actually we should probably panic if this fails */
 	if ((board = kzalloc(sizeof(*board), GFP_ATOMIC)) == NULL)
-		return NULL;	
+		return NULL;
 	board->fblock = rp;
 
 	/* Dump the format block for debugging purposes */
@@ -727,7 +710,7 @@ static struct nubus_board* __init nubus_add_board(int slot, int bytelanes)
 	rp = board->fblock;
 
 	board->slot = slot;
-	board->slot_addr = (unsigned long) nubus_slot_addr(slot);
+	board->slot_addr = (unsigned long)nubus_slot_addr(slot);
 	board->doffset = nubus_get_rom(&rp, 4, bytelanes);
 	/* rom_length is *supposed* to be the total length of the
 	 * ROM.  In practice it is the "amount of ROM used to compute
@@ -738,16 +721,16 @@ static struct nubus_board* __init nubus_add_board(int slot, int bytelanes)
 	board->rom_length = nubus_get_rom(&rp, 4, bytelanes);
 	board->crc = nubus_get_rom(&rp, 4, bytelanes);
 	board->rev = nubus_get_rom(&rp, 1, bytelanes);
-	board->format = nubus_get_rom(&rp,1, bytelanes);
+	board->format = nubus_get_rom(&rp, 1, bytelanes);
 	board->lanes = bytelanes;
 
 	/* Directory offset should be small and negative... */
-	if(!(board->doffset & 0x00FF0000))
+	if (!(board->doffset & 0x00FF0000))
 		pr_warn("Dodgy doffset!\n");
 	dpat = nubus_get_rom(&rp, 4, bytelanes);
-	if(dpat != NUBUS_TEST_PATTERN)
+	if (dpat != NUBUS_TEST_PATTERN)
 		pr_warn("Wrong test pattern %08lx!\n", dpat);
-		
+
 	/*
 	 *	I wonder how the CRC is meant to work -
 	 *		any takers ?
@@ -760,7 +743,7 @@ static struct nubus_board* __init nubus_add_board(int slot, int bytelanes)
 	nubus_move(&board->directory, nubus_expand32(board->doffset),
 	           board->lanes);
 
-	nubus_get_root_dir(board, &dir);	
+	nubus_get_root_dir(board, &dir);
 
 	/* We're ready to rock */
 	pr_info("Slot %X:\n", slot);
@@ -780,8 +763,9 @@ static struct nubus_board* __init nubus_add_board(int slot, int bytelanes)
 	}
 
 	while (nubus_readdir(&dir, &ent) != -1) {
-		struct nubus_dev*  dev;
-		struct nubus_dev** devp;
+		struct nubus_dev *dev;
+		struct nubus_dev **devp;
+
 		dev = nubus_get_functional_resource(board, slot, &ent);
 		if (dev == NULL)
 			continue;
@@ -789,32 +773,33 @@ static struct nubus_board* __init nubus_add_board(int slot, int bytelanes)
 		/* We zeroed this out above */
 		if (board->first_dev == NULL)
 			board->first_dev = dev;
-		
+
 		/* Put it on the global NuBus device chain. Keep entries in order. */
-		for (devp=&nubus_devices; *devp!=NULL; devp=&((*devp)->next))
+		for (devp = &nubus_devices; *devp != NULL;
+		     devp = &((*devp)->next))
 			/* spin */;
 		*devp = dev;
-		dev->next = NULL;		
+		dev->next = NULL;
 	}
 
 	/* Put it on the global NuBus board chain. Keep entries in order. */
-	for (boardp=&nubus_boards; *boardp!=NULL; boardp=&((*boardp)->next))
+	for (boardp = &nubus_boards; *boardp != NULL;
+	     boardp = &((*boardp)->next))
 		/* spin */;
 	*boardp = board;
 	board->next = NULL;
-	
+
 	return board;
 }
 
 void __init nubus_probe_slot(int slot)
 {
 	unsigned char dp;
-	unsigned char* rp;
+	unsigned char *rp;
 	int i;
 
-	rp = nubus_rom_addr(slot);	
-	for(i = 4; i; i--)
-	{
+	rp = nubus_rom_addr(slot);
+	for (i = 4; i; i--) {
 		int card_present;
 
 		rp--;
@@ -827,7 +812,7 @@ void __init nubus_probe_slot(int slot)
 		/* The last byte of the format block consists of two
 		   nybbles which are "mirror images" of each other.
 		   These show us the valid bytelanes */
-		if ((((dp>>4) ^ dp) & 0x0F) != 0x0F)
+		if ((((dp >> 4) ^ dp) & 0x0F) != 0x0F)
 			continue;
 		/* Check that this value is actually *on* one of the
 		   bytelanes it claims are valid! */
@@ -845,15 +830,14 @@ void __init nubus_scan_bus(void)
 {
 	int slot;
 
-	for(slot = 9; slot < 15; slot++)
-	{
+	for (slot = 9; slot < 15; slot++) {
 		nubus_probe_slot(slot);
 	}
 }
 
 static int __init nubus_init(void)
 {
-	if (!MACH_IS_MAC) 
+	if (!MACH_IS_MAC)
 		return 0;
 
 	/* Initialize the NuBus interrupts */
@@ -866,7 +850,7 @@ static int __init nubus_init(void)
 	/* And probe */
 	pr_info("NuBus: Scanning NuBus slots.\n");
 	nubus_devices = NULL;
-	nubus_boards  = NULL;
+	nubus_boards = NULL;
 	nubus_scan_bus();
 	nubus_proc_init();
 	return 0;
-- 
2.10.2
